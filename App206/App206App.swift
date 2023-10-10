//
//  App206App.swift
//  App206
//
//  Created by IGOR on 19/09/2023.
//

import SwiftUI
import FirebaseCore
import ApphudSDK
import Amplitude

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Apphud.start(apiKey: "app_k2iu4YDMxKKN7ombxFpYguoUK7TmrJ")
        Amplitude.instance().initializeApiKey("412bacd71651f02ddde154d5b765f5d5")
        
        FirebaseApp.configure()
        
        return true
    }
}

@main
struct App206App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            
            NavigationView(content: {
                
                ContentView()
                
            })

        }
    }
}
