//
//  TabBar.swift
//  App206
//
//  Created by IGOR on 20/09/2023.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    @State var tabs: [Tab] = [Tab.MyPlane, Tab.MyFlights, Tab.Statistics, Tab.Settings]
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 8, content: {
                        
                        Image(index.rawValue)
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? .white : .gray)
                        
                        if index.rawValue != "Add" {
                            
                            Text(index.rawValue)
                                .foregroundColor(selectedTab == index ? .white : .gray)
                                .font(.system(size: 12, weight: .semibold))
                        }
                    })
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 9)
        .padding(.bottom, 15)
        .background(Color("bg2"))
    }
}

enum Tab: String, CaseIterable {
    
    case MyPlane = "My Plane"
    
    case MyFlights = "My Flights"

    case Statistics = "Statistics"
    
    case Settings = "Settings"
}
