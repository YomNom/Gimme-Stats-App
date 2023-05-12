//
//  LoginView.swift
//  GimmeStats
//
//  Created by Christina Duvall on 11/2/22.
//

import SwiftUI
import Firebase


struct LoginView: View {
    @EnvironmentObject var vm: UserStateViewModel
    @State private var isLogin = false
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var email: String = ""
    
    @State private var forgotPassword = false
    @State private var createAccount = false
    @State private var wrongPassword = false
    @State private var passwordAlert = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Login")
                    .frame(height: 100)
                    .foregroundColor(.blue)
                    .font(.largeTitle)
                
                VStack {
                    TextField(
                        "Email",
                        text: $email
                    )
                    .disableAutocorrection(true)
                    .padding()
                    .textInputAutocapitalization(.never)
                    SecureField(
                        "Password",
                        text: $password
                    )
                    .disableAutocorrection(true)
                    .padding()
                    .textInputAutocapitalization(.never)
                }
                .textFieldStyle(.roundedBorder)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.blue)
                        .frame(width: 200, height: 50)
                    
                        .navigationDestination(isPresented: $isLogin) {
                            FeedView()
                        }
                    
                    Button {
                        login()
                    } label: {
                        Text("Log in")
                            .font(Font.title3)
                            .foregroundColor(.white)
                            .alert("Wrong Email or Password", isPresented: $wrongPassword){
                                Button("Dismiss", role:.cancel){}
                            }
                    }
                    .padding()
                }
                
                VStack {
                    Button {
                        self.forgotPassword.toggle()
                    } label: {
                        Text("Forgot Password?")
                            .font(.body)
                            .padding()
                            .navigationDestination(isPresented: $forgotPassword) {
                                ResetPassword(email: email)
                                     }
                            
                    }
                    
                    
                }
                
            }
        }
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password)  { result, error in
            if error != nil { // Logged in
                self.wrongPassword.toggle()
                print(error!.localizedDescription)
            }
            else { 
                print("Successfully logged in as user: \(result?.user.uid ?? "")")
                self.isLogin.toggle()
                Task {
                    await vm.signIn(
                        email: email,
                        password: password
                    )
                }
            }
        }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(UserStateViewModel())
    }
}
