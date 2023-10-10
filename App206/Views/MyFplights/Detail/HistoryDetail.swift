//
//  HistoryDetail.swift
//  App206
//
//  Created by IGOR on 20/09/2023.
//

import SwiftUI

struct HistoryDetail: View {
    
    @Environment(\.presentationMode) var router
    
    @StateObject var viewModel: MyFlightsViewModel
    
    var body: some View {
        
        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack {
                        
                        VStack {
                            
                            Text("\(viewModel.current_history?.distance ?? 0) km")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                            
                            HStack {
                                
                                Circle()
                                    .stroke(.gray)
                                    .frame(width: 12, height: 12)
                                
                                Spacer()
                                
                                Text(" ----------------------------------------")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 12, weight: .regular))
                                
                                Spacer()
                                
                                Circle()
                                    .stroke(.gray)
                                    .frame(width: 12, height: 12)
                            }
                            
                            HStack {
                                
                                Text(viewModel.current_history?.cityFrom ?? "")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .regular))
                                
                                Spacer()
                                
                                Text(viewModel.current_history?.cityTo ?? "")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .regular))

                            }
                            .padding(.bottom, 4)
                            
                            HStack {
                                
                                Text(viewModel.current_history?.airportFrom ?? "")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 12, weight: .regular))
                                
                                Spacer()
                                
                                Text(viewModel.current_history?.airportTo ?? "")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 12, weight: .regular))
                            }
                            .padding(.bottom, 4)

                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                        .padding(.horizontal)
                        
                        HStack {
                            
                            Text("Flight Date")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                            
                            Spacer()
                            
                            Text((viewModel.current_history?.departure ?? Date()).convertDate(format: "MMM dd yyyy"))
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                        .padding(.horizontal)
                        
                        HStack {
 
                            
                            VStack(alignment: .leading) {
                                
                                Text("Distance")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                                
                                Text("\(viewModel.current_history?.distance ?? 0) km")
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .semibold))
                            }
                            .frame(maxWidth: .infinity)
//
//                            Button(action: {
//
//                                if viewModel.saved_history.contains(viewModel.current_history?.airlineCompany ?? "") {
//
//                                    if let indexer = viewModel.saved_history.firstIndex(of: viewModel.current_history?.airlineCompany ?? "") {
//
//                                        viewModel.saved_history.remove(at: indexer)
//                                    }
//                                } else {
//
//                                    viewModel.saved_history.append(viewModel.current_history?.airlineCompany ?? "")
//                                }
//
//                            }, label: {
//
//                                Image(systemName: viewModel.saved_history.contains(viewModel.current_history?.airlineCompany ?? "") ? "heart.fill" : "heart")
//                                    .foregroundColor(viewModel.saved_history.contains(viewModel.current_history?.airlineCompany ?? "") ? .white : .gray)
//                                    .font(.system(size: 21, weight: .regular))
//                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                        .padding(.horizontal)
                    }
                }
                
                Spacer()
            }
        }
    }
}

struct HistoryDetail_Previews: PreviewProvider {
    static var previews: some View {
        HistoryDetail(viewModel: MyFlightsViewModel())
    }
}
