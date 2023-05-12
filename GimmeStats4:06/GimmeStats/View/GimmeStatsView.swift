//
//  GimmeStatsView.swift
//  gimmeStats
//
//  Created by Christina Duvall on 10/21/22.
//

// VIEW
// iPhone 14 Pro simulator

import SwiftUI

struct GimmeStatsView: View {
    
    // var viewModel
    // is our single connection point to the ViewModel and is subscribed to an observable object
    // which allows the view to be reactive
    @ObservedObject var viewModel: GimmeStatsViewModel
    @EnvironmentObject var vm: UserStateViewModel
    
    var body: some View {
        VStack {
            if (vm.isLoggedIn) {  
                FeedView()
            }
            else {
                InitialView()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GimmeStatsView(viewModel: GimmeStatsViewModel())
            .environmentObject(UserStateViewModel())
    }
        
}

