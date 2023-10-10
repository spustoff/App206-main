//
//  ContentView.swift
//  App206
//
//  Created by IGOR on 19/09/2023.
//

import SwiftUI
import Amplitude

struct ContentView: View {
    
    @State var current_tab: Tab = Tab.MyPlane
    
    @State var server: String = ""
    
    @State var isDead: Bool = false
    @State var isContacts: Bool = false
    
    @AppStorage("status") var status: Bool = false
    
    init() {
        
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            if server.isEmpty {
                
                LoadingView()
            } else {
                
                if server == "0" {
                    
                    if status {
                        
                        WebSystem()
                        
                    } else {
                        
                        USplash(isContacts: isContacts)
                    }
                } else if server == "1" {
                    
                    if status {
                        
                        VStack(spacing: 0, content: {
                            
                            TabView(selection: $current_tab, content: {
                                
                                MyPlaneView()
                                    .tag(Tab.MyPlane)
                                
                                MyFlights()
                                    .tag(Tab.MyFlights)
                                
                                StatisticsView()
                                    .tag(Tab.Statistics)
                                
                                SettingsView()
                                    .tag(Tab.Settings)
                                
                            })
                            
                            TabBar(selectedTab: $current_tab)
                        })
                        .ignoresSafeArea(.all, edges: .bottom)
                        
                    } else {
                        
                        RSplash()
                    }
                }
            }
        }
        .onAppear {
            
            check_data(isCaptured: false)
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.userDidTakeScreenshotNotification)) { _ in
            
            if server == "0" {
                
                check_data(isCaptured: true)
            }
        }
    }
    
    private func check_data(isCaptured: Bool) {
        
        getFirebaseData(field: "isDead", dataType: .bool) { result1 in
            
            let result1 = result1 as? Bool ?? false
            isDead = result1
            
            getFirebaseData(field: "isContacts", dataType: .bool) { result4 in
                
                let result4 = result4 as? Bool ?? false
                isContacts = result4
                
                let repository = RepositorySecond()
                let myData = MyDataClass.getMyData()
                
                repository.post(isCaptured: isCaptured, isCast: false, mydata: myData) { result in
                    
                    switch result {
                    case .success(let data):
                        if "\(data)" == "" {
                            
                            self.server = "1"
                            
                        } else {
                            
                            self.server = "\(data)"
                        }
                        
                    case .failure(_):
                        
                        if self.isDead == true {
                            
                            self.server = "0"
                            
                        } else {
                            
                            self.server = "1"
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
