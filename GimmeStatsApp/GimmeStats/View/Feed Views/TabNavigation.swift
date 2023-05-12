//
//  TabNavigation.swift
//  GimmeStats
//
//  Created by Joey Yong on 11/17/22.
//

import SwiftUI

struct TabNavigation: View {
    @StateObject var dataManager = DataManager()
    var body: some View {
        TabView {
            Home()
                .tabItem() {
                    Image(systemName: "house")
                } .environmentObject(dataManager)
            Calendar()
                .tabItem() {
                    Image(systemName: "calendar")
                } .environmentObject(dataManager)
            Message().navigationBarHidden(false)
                .tabItem() {
                    Image(systemName: "bubble.right.fill")
                }
            ProfileView(profile: Profile(firstName: "", lastName: "", userName: "", bio: "", currentYear: "", pronouns: "", GPA: "", sport: "", position: "", role: ""))
                .tabItem() {
                    Image(systemName: "person")
                } .environmentObject(dataManager)
            
        }
    }
}

struct TabNavigation_Previews: PreviewProvider {
    static var previews: some View {
        TabNavigation()
            
    }
}
