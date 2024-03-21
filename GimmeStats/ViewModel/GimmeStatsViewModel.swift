//
//  GimmeStatsViewModel.swift
//  GimmeStats
//
//  Created by Christina Duvall on 10/22/22.
//

// VIEWMODEL

// Import SwiftUI because it uses UI elements
import SwiftUI

// class GimmeStatsViewModel
// is a class rather than a struct because there may be several Views that share this
// Observable Object allows the viewmodel participate to be reactive and gain objectWillChange
class GimmeStatsViewModel: ObservableObject {
    
    // var model
    // is private so that only functions and computed properties inside the ViewModel can access it directly
    // marked Published so anytime the model changes it calls objectWillChange.send
    @Published private var model: GimmeStats<String> = GimmeStatsViewModel.launchApp()
    
    // static function
    // Christina Duvall
    //  for launching initial app screen and returns a gimmeStats of type String
    // Pre: the app has never been launched before
    // Post: The user creates an account or is logged into a previously made account
    static func launchApp() -> GimmeStats<String> {
        return GimmeStats<String>()
    }
    
    @State private var willMoveToNextScreen = false
    
    // MARK: - Access to the Model
    
    
    // MARK: - Intent(s)
    
    
    
    // MARK: - Symbolic Constants
}


