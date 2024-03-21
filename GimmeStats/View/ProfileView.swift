//
//  ProfileView.swift
//  GimmeStats
//
//  Created by Christina Duvall on 11/10/22.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var newProfile = ""
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
