//
//  MyPlaneView.swift
//  App206
//
//  Created by IGOR on 19/09/2023.
//

import SwiftUI

struct MyPlaneView: View {
    
    @AppStorage("planeName") var planeName = ""
    @AppStorage("millage") var millage = ""
    @AppStorage("speed") var speed = ""
    @AppStorage("range") var range = ""
    @AppStorage("places") var places = ""
    
    var body: some View {
        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                Image("plane")
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .frame(height: 300)
                    .ignoresSafeArea()
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    Text(planeName)
                        .foregroundColor(.white)
                        .font(.system(size: 26, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                        
                        VStack {
                            
                            ZStack {
                                
                                Circle()
                                    .stroke(.gray)
                                    .frame(width: 130, height: 120)
                                
                                Text("\(millage) km")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .medium))
                            }
                            
                            Text("Millage")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                                .padding(3)
                                .background(RoundedRectangle(cornerRadius: 6).stroke(.gray))
                                .offset(y: -40)
                            
                        }
                        
                        VStack {
                            
                            ZStack {
                                
                                Circle()
                                    .stroke(.gray)
                                    .frame(width: 130, height: 120)
                                
                                Text("\(speed) km/h")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .medium))
                            }
                            
                            Text("Speed")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                                .padding(3)
                                .background(RoundedRectangle(cornerRadius: 6).stroke(.gray))
                                .offset(y: -40)
                            
                        }
                        
                        VStack {
                            
                            ZStack {
                                
                                Circle()
                                    .stroke(.gray)
                                    .frame(width: 130, height: 120)
                                
                                Text("\(range) km")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .medium))
                            }
                            
                            Text("Range")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                                .padding(3)
                                .background(RoundedRectangle(cornerRadius: 6).stroke(.gray))
                                .offset(y: -40)
                            
                        }
                        
                        VStack {
                            
                            ZStack {
                                
                                Circle()
                                    .stroke(.gray)
                                    .frame(width: 130, height: 120)
                                
                                Text("\(places) ")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .medium))
                            }
                            
                            Text("Places")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                                .padding(3)
                                .background(RoundedRectangle(cornerRadius: 6).stroke(.gray))
                                .offset(y: -40)
                            
                        }
                    })

                }
            }
        }
    }
}

struct MyPlaneView_Previews: PreviewProvider {
    static var previews: some View {
        MyPlaneView()
    }
}
