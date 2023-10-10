//
//  RSplash.swift
//  App206
//
//  Created by IGOR on 19/09/2023.
//

import SwiftUI

struct RSplash: View {
    var body: some View {
        ZStack {
            
            Color("primary")
                .ignoresSafeArea()
            
            VStack {
                
                Image("RSplash")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    Text("Your plane")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .semibold))
                        .padding()
                        .padding(.top)
                    
                    Text("All information about your aircraft")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .regular))
                    
                    NavigationLink(destination: {
                        
                        RSplash2()
                            .navigationBarBackButtonHidden()
                        
                    }, label:  {
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                            .padding()
                    })
                    .padding(.top, 60)
                    .padding(.bottom)
                }
                .frame(maxWidth: .infinity)
                .background(Color("bg2").ignoresSafeArea())
            }
        }
    }
}

struct RSplash_Previews: PreviewProvider {
    static var previews: some View {
        RSplash()
    }
}
