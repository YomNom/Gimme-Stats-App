//
//  MenuView.swift
//  GimmeStats
//
//  Created by Joey Yong on 11/17/22.
//

import SwiftUI
import Firebase

struct MenuView: View {
    @EnvironmentObject var vm: UserStateViewModel
    @State private var isLoggedOut = false
    @State private var setting = false
    @State private var faq = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "gear")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Settings")
                    .foregroundColor(.gray)
                    .font(.headline)
                    .onTapGesture {
                        self.setting.toggle()
                    }
                    .sheet(isPresented: $setting ) {
                        SettingsView()
                    }
            }
            .padding(.top, 100)
            HStack {
                Image(systemName: "questionmark.diamond")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Help")
                    .foregroundColor(.gray)
                    .font(.headline)
                    .onTapGesture {
                        self.faq.toggle()
                    }
                    .sheet(isPresented: $faq ) {
                        HelpPageView()
                    }
            }
            .padding(.top, 30)
            HStack {
                Button {
                    logout()
                    self.isLoggedOut.toggle()
                    Task {
                        await vm.signOut()
                    }
                } label: {
                    Image(systemName: "iphone.and.arrow.forward")
                        .foregroundColor(.gray)
                        .imageScale(.large)
                    Text("Log Out")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
                .navigationDestination(isPresented: $isLoggedOut) {
                    InitialView()
                    //GimmeStatsView(viewModel: GimmeStatsViewModel())
                }
            }
            .padding(.top, 30)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(red: 32/255, green: 32/255, blue: 32/255))
                    .edgesIgnoringSafeArea(.all)
    }
    func logout() {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
            .environmentObject(UserStateViewModel())
    }
}
