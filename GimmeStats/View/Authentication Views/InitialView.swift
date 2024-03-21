//
//  InitialView.swift
//  GimmeStats
//
//  Created by Christina Duvall on 10/22/22.
//

import SwiftUI
import Firebase


// struct InitialView
//  the inital view for opening the app
//  allows you to create an account or login to a pre-existing one


struct InitialView: View {
    
    @State private var hasAccount = false
    @State private var login = false
    //@State private var userIsLoggedIn = false
    
    var body: some View {
        content
    }
    
    var content: some View {
        NavigationStack{
            VStack {
                Text("GimmeStats")
                    .padding(20)
                    .font(.largeTitle)
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(.blue)
                            .frame(width: 200, height: 50)
                        Button(action: {
                            self.login.toggle()
                        }, label: {
                            Text("Log In")
                                .font(Font.title3.weight(.bold))
                                .foregroundColor(.white)
                        })
                        .navigationDestination(isPresented: $login) {
                                     LoginView()
                                 }
                          
                    }
                    ZStack {
                        Button(action: {
                            self.hasAccount.toggle()
                        }, label: {
                            Text("Create Account")
                        })
                        .navigationDestination(isPresented: $hasAccount) {
                                     CreateAccountView()
                                 }
                        
                        }
                    }
                        
                }
            
            }
    }
      
    }


