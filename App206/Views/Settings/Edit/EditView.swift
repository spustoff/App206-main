//
//  EditView.swift
//  App206
//
//  Created by IGOR on 20/09/2023.
//

import SwiftUI

struct EditView: View {
    
    @AppStorage("planeName") var planeName = ""
    @AppStorage("millage") var millage = ""
    @AppStorage("speed") var speed = ""
    @AppStorage("range") var range = ""
    @AppStorage("places") var places = ""
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 16, weight: .regular))
                                
                                Text("Back")
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 15, weight: .regular))
                            }
                        })
                        .padding(.horizontal)
                        
                        Spacer()
                    }
                    
                    Text("Edit plane")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                        .padding(2)
                    
                }
                .padding(.top)
                
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
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Text("Save")
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

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView()
    }
}
