//
//  Reviews.swift
//  App206
//
//  Created by IGOR on 19/09/2023.
//

import SwiftUI
import StoreKit

struct Reviews: View {
    
    let isContacts: Bool
    
    var body: some View {

        ZStack {
            
            Color("primary")
                .ignoresSafeArea()
            
            VStack {
                
                Image("Reviews")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    Text("Rate our app in the AppStore")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .semibold))
                        .multilineTextAlignment(.center)
                        .padding()
                        .padding(.top)
                    
                    Text("Help make the app even better")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .regular))
                    
                    NavigationLink(destination: {
                        
                        if isContacts == true {
                            
                            Manager()
                                .navigationBarBackButtonHidden()
                            
                        } else if isContacts == false {

                            Notif()
                                .navigationBarBackButtonHidden()
                        }
                        
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
        .onAppear {
            
            SKStoreReviewController.requestReview()
        }
    }
}

struct Reviews_Previews: PreviewProvider {
    static var previews: some View {
        Reviews(isContacts: false)
    }
}
