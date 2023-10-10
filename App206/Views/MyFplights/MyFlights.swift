//
//  MyFlights.swift
//  App206
//
//  Created by IGOR on 19/09/2023.
//

import SwiftUI

struct MyFlights: View {
    
    @StateObject var viewModel = MyFlightsViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg3")
                .ignoresSafeArea()
            
            VStack {
                
                Button(action: {
                    
                    viewModel.isAdd = true
                    
                }, label: {
                    
                    Image(systemName: "plus")
                        .foregroundColor(.black)
                        .padding(2)
                        .background(Circle().fill(Color("primary")))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                })
                .padding(.horizontal)
                .padding(.top)
                
                Text("My flights")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                VStack {
                    
                    if viewModel.getItems().isEmpty {
                        
                        VStack {
                            
                            Image("dep")
                                .padding()
                            
                            Text("Empty")
                                .foregroundColor(.white)
                                .font(.system(size: 22, weight: .semibold))
                            
                            Text("There were no flights on this date")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .regular))
                                .padding(.top, 6)
                            
                        }
                        .frame(maxHeight: .infinity, alignment: .center)
                        .background(Color("bg"))
                        
                    } else {
                        
                        ScrollView(.vertical, showsIndicators: true) {
                            
                            LazyVStack {
                                
                                ForEach(viewModel.getItems(), id: \.self) { index in
                                    
                                    VStack(alignment: .leading) {
                                        
                                        HStack {
                                            
                                            Text(index.airportTo ?? "")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 12, weight: .regular))
                                            
                                            Text("-")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 12, weight: .regular))
                                            
                                            Text(index.airportTo ?? "")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 12, weight: .regular))
                                            
                                            Spacer()
                         
                                        }
                                        .padding(.bottom, 8)
                                        
                                        Text("\(index.cityFrom ?? "") - \(index.cityTo ?? "")")
                                            .foregroundColor(.white)
                                            .font(.system(size: 17, weight: .black))
                                        
                                        HStack {
                                            
                                                
                                                Text((index.departure ?? Date()).convertDate(format: "MMM d HH:mm"))
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 12, weight: .regular))

                                            Spacer()
                                            
                                                Text("\(index.distance) km")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 12, weight: .regular))
        
                                        }
                                        .padding(.top, 6)
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                                    .onTapGesture {
                                        
                                        viewModel.current_history = index
                                        
                                        viewModel.isDetail = true
                                    }
                                }
                            }
                            .padding()
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .background(Color("bg2"))
            }
        }
        .onAppear {
            
            viewModel.fetchHistory()
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            Addview(flightModel: viewModel)
        })
                .sheet(isPresented: $viewModel.isDetail, content: {
        
                    HistoryDetail(viewModel: viewModel)
                })
    }
}

struct MyFlights_Previews: PreviewProvider {
    static var previews: some View {
        MyFlights()
    }
}
