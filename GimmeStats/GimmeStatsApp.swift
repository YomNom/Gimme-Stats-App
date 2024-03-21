//
//  GimmeStatsApp.swift
//  GimmeStats
//
//  Created by Christina Duvall on 10/22/22.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import Combine

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        return true
    }
}

@main
struct GimmeStatsApp: App {
    @StateObject var dataManager = DataManager()
    @StateObject var userStateViewModel = UserStateViewModel()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate   
    
    var body: some Scene {
        WindowGroup {
            NavigationView { //3/16 if something bad after this...
                GimmeStatsView(viewModel: GimmeStatsViewModel())
            }
            .environmentObject(dataManager)
            .environmentObject(userStateViewModel) 
        }
    }
}
