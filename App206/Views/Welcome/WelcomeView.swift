//
//  WelcomeView.swift
//  App206
//
//  Created by IGOR on 19/09/2023.
//

import SwiftUI

struct WelcomeView: View {
    
    @AppStorage("planeName") var planeName = ""
    @AppStorage("millage") var millage = ""
    @AppStorage("speed") var speed = ""
    @AppStorage("range") var range = ""
    @AppStorage("places") var places = ""
    @AppStorage("status") var status: Bool = false

    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Welcome!")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .semibold))
                
                Text("Add details about your aircraft")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .semibold))
                    .padding(2)
                
                ScrollView(.vertical, showsIndicators: false) {
                
                Image("plane1")
                    .padding()
                                    
                    HStack {
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Name plane")
                                .foregroundColor(planeName.isEmpty ? .gray : .white)
                                .font(.system(size: 13, weight: .medium))
                                .opacity(planeName.isEmpty ? 1 : 0)
                                .padding(.leading, 20)
                            
                            TextField("", text: $planeName)
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .medium))
                                .padding(.leading, 20)
                        })
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                    .padding(.horizontal)
                    .padding(.bottom)
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                        
                        VStack(alignment: .leading) {
                            
                            Text("Millage")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                            
                            HStack {
                                
                                ZStack(alignment: .leading, content: {
                                    
                                    Text("0 km")
                                        .foregroundColor(millage.isEmpty ? .gray : .white)
                                        .font(.system(size: 13, weight: .medium))
                                        .opacity(millage.isEmpty ? 1 : 0)
                                        .padding(.leading, 20)
                                    
                                    TextField("", text: $millage)
                                        .foregroundColor(.white)
                                        .font(.system(size: 13, weight: .medium))
                                        .padding(.leading, 20)
                                })
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                        }
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading) {
                            
                            Text("Speed")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                            
                            HStack {
                                
                                ZStack(alignment: .leading, content: {
                                    
                                    Text("0 km/h")
                                        .foregroundColor(speed.isEmpty ? .gray : .white)
                                        .font(.system(size: 13, weight: .medium))
                                        .opacity(speed.isEmpty ? 1 : 0)
                                        .padding(.leading, 20)
                                    
                                    TextField("", text: $speed)
                                        .foregroundColor(.white)
                                        .font(.system(size: 13, weight: .medium))
                                        .padding(.leading, 20)
                                })
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                        }
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading) {
                            
                            Text("Range")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                            
                            HStack {
                                
                                ZStack(alignment: .leading, content: {
                                    
                                    Text("0 km")
                                        .foregroundColor(range.isEmpty ? .gray : .white)
                                        .font(.system(size: 13, weight: .medium))
                                        .opacity(range.isEmpty ? 1 : 0)
                                        .padding(.leading, 20)
                                    
                                    TextField("", text: $range)
                                        .foregroundColor(.white)
                                        .font(.system(size: 13, weight: .medium))
                                        .padding(.leading, 20)
                                })
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                        }
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading) {
                            
                            Text("Places")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                            
                            HStack {
                                
                                ZStack(alignment: .leading, content: {
                                    
                                    Text("0")
                                        .foregroundColor(places.isEmpty ? .gray : .white)
                                        .font(.system(size: 13, weight: .medium))
                                        .opacity(places.isEmpty ? 1 : 0)
                                        .padding(.leading, 20)
                                    
                                    TextField("", text: $places)
                                        .foregroundColor(.white)
                                        .font(.system(size: 13, weight: .medium))
                                        .padding(.leading, 20)
                                })
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                        }
                        .padding(.horizontal)
                        
                    })
                    
                    Button(action: {
                        
                        status = true
                        
                    }, label: {
                        
                        Text("Add Plane")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                            .padding()
                    })
                }
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
