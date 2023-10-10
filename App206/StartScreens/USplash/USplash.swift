//
//  USplash.swift
//  App206
//
//  Created by IGOR on 19/09/2023.
//

import SwiftUI

struct USplash: View {
    
    let isContacts: Bool

    var body: some View {

        ZStack {
            
            Color("primary")
                .ignoresSafeArea()
            
            VStack {
                
                Image("USplash")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    Text("Fly the maximum")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .semibold))
                        .padding()
                        .padding(.top)
                    
                    Text("Achieve your best results")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .regular))
                    
                    NavigationLink(destination: {
                        
                        Reviews(isContacts: isContacts)
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

struct USplash_Previews: PreviewProvider {
    static var previews: some View {
        USplash(isContacts: false)
    }
}
