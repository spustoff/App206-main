//
//  SettingsView.swift
//  App206
//
//  Created by IGOR on 20/09/2023.
//

import SwiftUI
import CoreData
import StoreKit

struct SettingsView: View {
    
    @AppStorage("dist") var dist = ""
    @AppStorage("saved_history") var saved_history: [String] = []
    @State var isReset: Bool = false
    @State var isEdit: Bool = false
    
    var body: some View {
        
        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                VStack {
                    
                    Button(action: {
                        
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                            .padding(2)
                            .background(Circle().fill(Color("primary")))
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    })
                    .padding(.horizontal)
                    .padding(.top)
                    .opacity(0)
                    
                    Text("Settings")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        Button(action: {
                            
                            isEdit = true
                            
                        }, label: {
                            
                            HStack {
                                
                                Image("ep")
                                    .frame(width: 30, height: 30)
                                
                                
                                Text("Edit plane")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .regular))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 18, weight: .regular))
                            }
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).stroke(.gray.opacity(0.3)))
                        
                        Button(action: {
                            
                            SKStoreReviewController.requestReview()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color("primary"))
                                    .frame(width: 30, height: 30)
                                
                                Text("Rate app")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .regular))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 18, weight: .regular))
                            }
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).stroke(.gray.opacity(0.3)))
                        
                        Button(action: {
                            
                            guard let url = URL(string: "https://www.termsfeed.com/live/a3c7b3cd-02e2-41f7-b9f5-e62d0710edc4") else { return }
                            
                            UIApplication.shared.open(url)
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "bubble.right.fill")
                                    .foregroundColor(Color("primary"))
                                    .frame(width: 30, height: 30)
                                
                                
                                Text("Usage Policy")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .regular))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 18, weight: .regular))
                            }
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).stroke(.gray.opacity(0.3)))
                        
                        Button(action: {
                            
                            isReset = true
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "trash")
                                    .foregroundColor(Color("primary"))
                                    .frame(width: 30, height: 30)
                                
                                Text("Reset progress")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .regular))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 18, weight: .regular))
                            }
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).stroke(.gray.opacity(0.3)))
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
            }
            .ignoresSafeArea(.all, edges: .bottom)
            .sheet(isPresented: $isEdit, content: {
                
                EditView()
            })
            .overlay (
                
                ZStack {
                    
                    Color.black.opacity(isReset ? 0.5 : 0)
                        .ignoresSafeArea()
                        .onTapGesture {
                            
                            withAnimation(.spring()) {
                                
                                isReset = false
                            }
                        }
                    
                    VStack {
                        
                        HStack {
                            
                            Spacer()
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    isReset = false
                                }
                                
                            }, label: {
                                
                                Image(systemName: "xmark")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                            })
                        }
                        
                        Text("Reset progress?")
                            .foregroundColor(.black)
                            .font(.system(size: 24, weight: .semibold))
                            .padding()
                        
                        Text("Your entire progress will be permanently deleted")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                            .multilineTextAlignment(.center)
                        
                        Button(action: {
                            
                            deleteAllData()
                            dist = ""
                            saved_history.removeAll()
                            
                            withAnimation(.spring()) {
                                
                                isReset = false
                            }
                            
                        }, label: {
                            
                            Text("Reset")
                                .foregroundColor(.red)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            
                        })
                        .padding(.top, 25)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.8)))
                    .padding()
                    .offset(y: isReset ? 0 : UIScreen.main.bounds.height)
                }
            )
        }
    }
    
    func deleteAllData() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "HistoryModel")
        
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            
            try context.execute(deleteRequest)
            
            saved_history.removeAll()
            
        } catch let error as NSError {
            
            print("Error deleting all history: \(error), \(error.userInfo)")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
