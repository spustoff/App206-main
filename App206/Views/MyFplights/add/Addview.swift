//
//  Addview.swift
//  App206
//
//  Created by IGOR on 19/09/2023.
//

import SwiftUI

struct Addview: View {
    
    @StateObject var viewModel = AddViewModel()
    @StateObject var flightModel: MyFlightsViewModel
    
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg3")
                .ignoresSafeArea()
            
            VStack {
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(.gray)
                    .frame(width: 30, height: 5)
                    .padding()
                
                Text("New flight")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .semibold))
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        HStack {

                            ZStack(alignment: .leading, content: {
                                
                                Text("From")
                                    .foregroundColor(viewModel.cityFrom.isEmpty ? .gray : .white)
                                    .font(.system(size: 13, weight: .medium))
                                    .opacity(viewModel.cityFrom.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.cityFrom)
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .medium))
                            })
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                        .padding(.horizontal)
                        
                        HStack {

                            ZStack(alignment: .leading, content: {
                                
                                Text("Airport Name")
                                    .foregroundColor(viewModel.airportFrom.isEmpty ? .gray : .white)
                                    .font(.system(size: 13, weight: .medium))
                                    .opacity(viewModel.airportFrom.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.airportFrom)
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .medium))
                            })
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                        .padding(.horizontal)
                        
                        HStack {

                            ZStack(alignment: .leading, content: {
                                
                                Text("To")
                                    .foregroundColor(viewModel.cityTo.isEmpty ? .gray : .white)
                                    .font(.system(size: 13, weight: .medium))
                                    .opacity(viewModel.cityTo.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.cityTo)
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .medium))
                            })
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                        .padding(.horizontal)
                        .padding(.top)
                        
                        HStack {

                            ZStack(alignment: .leading, content: {
                                
                                Text("Airport Name")
                                    .foregroundColor(viewModel.airportTo.isEmpty ? .gray : .white)
                                    .font(.system(size: 13, weight: .medium))
                                    .opacity(viewModel.airportTo.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.airportTo)
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .medium))
                            })
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                        .padding(.horizontal)
                        
                        HStack {

                            ZStack(alignment: .leading, content: {
                                
                                Text("Distance")
                                    .foregroundColor(viewModel.distance.isEmpty ? .gray : .white)
                                    .font(.system(size: 13, weight: .medium))
                                    .opacity(viewModel.distance.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.distance)
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .medium))
                            })
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                        .padding(.horizontal)
                        .padding(.top)
                        
                        HStack {
                            
                            Text("Flight date")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .medium))
                            
                            Spacer()

                            DatePicker("Departure", selection: $viewModel.departure, in: Date()..., displayedComponents: .date)
                                .labelsHidden()
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                        .padding(.horizontal)
                    }
                }
                
                Button(action: {
                    
                    viewModel.addToHistory {
                        
                        flightModel.fetchHistory()
                        
                        router.wrappedValue.dismiss()
                        
                        viewModel.cityFrom = ""
                        viewModel.cityTo = ""
                        viewModel.airportFrom = ""
                        viewModel.airportTo = ""
                        viewModel.distance = ""
                    }
                    
                    viewModel.dist += Int(viewModel.distance) ?? 0
                    
                }, label: {
                    
                    Text("Add Flight")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        .padding()
                })
            }
        }
    }
}

struct Addview_Previews: PreviewProvider {
    static var previews: some View {
        Addview(flightModel: MyFlightsViewModel())
    }
}
