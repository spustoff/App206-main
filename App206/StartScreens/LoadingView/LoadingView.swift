//
//  LoadingView.swift
//  App206
//
//  Created by IGOR on 19/09/2023.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {

        ZStack {
            
            Color("primary")
                .ignoresSafeArea()
            
            VStack {
                
                Image("Backgr")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Image("LogoPig")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom, 250)
            }
            
            VStack {
                
                ProgressView()
                    .padding()
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
