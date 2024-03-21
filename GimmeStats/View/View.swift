//
//  View.swift
//  GimmeStats
//
//  Created by Christina Duvall on 11/2/22.
//

import SwiftUI

// extension to View protocol for navigation

extension View {
    /// Navigate to a new view.
    /// - Parameters:
    ///   - view: View to navigate to.
    ///   - binding: Only navigates when this condition is `true`.
    func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
        NavigationStack {
            ZStack {
                self
                    .navigationBarTitle("")
                    .navigationBarHidden(true)

               /* NavigationLink(
                    destination: view
                        .navigationBarTitle("")
                        .navigationBarHidden(true),
                    isActive: binding
                ) {
                    EmptyView()
                }*/
            }
        }
        .navigationViewStyle(.stack)
    }
}
