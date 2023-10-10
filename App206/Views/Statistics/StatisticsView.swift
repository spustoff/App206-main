//
//  StatisticsView.swift
//  App206
//
//  Created by IGOR on 20/09/2023.
//

import SwiftUI

struct StatisticsView: View {
    
    @AppStorage("dist") var dist: Int = 0

    var body: some View {

        ZStack {
            
            Color("bg3")
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
                    
                    Text("Statistics")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    
                    Image("stat")
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .frame(height: 250)
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack(alignment: .leading, content: {
                        
                        Text("Average distance per flight")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                            .padding()
                        
                        Text("\(dist) km")
                            .foregroundColor(.white)
                            .font(.system(size: 26, weight: .semibold))
                            .padding(.horizontal)
                        
                        RoundedRectangle(cornerRadius: 5)
                            .fill(.gray.opacity(0.4))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.horizontal)
                            .padding(.bottom)
                        
                        Text("Longest flight")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                            .padding()
                        
                        Text("\(Int.random(in: 2000...7000)) km")
                            .foregroundColor(.white)
                            .font(.system(size: 26, weight: .semibold))
                            .padding(.horizontal)
                        
                        RoundedRectangle(cornerRadius: 5)
                            .fill(.gray.opacity(0.4))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.horizontal)
                            .padding(.bottom)
                        
                        Text("Max money spent")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                            .padding()
                        
                        Text("\(Int.random(in: 0...6000)) km")
                            .foregroundColor(.white)
                            .font(.system(size: 26, weight: .semibold))
                            .padding(.horizontal)
                        
                        RoundedRectangle(cornerRadius: 5)
                            .fill(.gray.opacity(0.4))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.horizontal)
                            .padding(.bottom)
                    })
                }
                .background(Color("bg2"))
            }
        }
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
    }
}
