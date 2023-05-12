//
//  CreateAccountView.swift
//  GimmeStats
//
//  Created by Christina Duvall on 11/2/22.
//
import SwiftUI
import Firebase

struct CreateAccountView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var signInSuccess = false
    @State private var wrongButton = false
    @State private var goToLogin = false
    
    @State private var Username: String = ""
    @State private var fName: String = ""
    @State private var lName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    var userRoles = ["Coach", "Athlete"]
    @State private var selectedAccount = "Athlete"
    
    var body: some View {
        NavigationStack {
            
        
            /*
                Button {
                    self.wrongButton.toggle()
                } label: {
                    Label("", systemImage: "arrow.left")
                        .navigationDestination(isPresented: $wrongButton) {
                            InitialView()
                                .navigationBarBackButtonHidden()
                        }
                        //.offset(x: -150)
                    
                      
                } */
            
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(.white)
                    .frame(width: 45, height: 40)
                Button {
                    self.wrongButton.toggle()
                } label: {
                    Label("", systemImage: "arrow.left")
                        .foregroundColor(.blue)
                        .navigationDestination(isPresented: $wrongButton) {
                            InitialView()
                                .navigationBarBackButtonHidden()
                        }
                }
            }
            .offset(x: -150)
            
            VStack {
                    Text("Create Account")
                        .frame(height: 100)
                        .foregroundColor(.blue)
                        .font(.title3)
                        .bold(true)
                        .offset(y: -50)
                    
                    VStack {
                        TextField(
                            "Username",
                            text: $Username
                        )
                        .disableAutocorrection(true)
                        .padding()
                        .textInputAutocapitalization(.never)
                        TextField(
                            "First Name",
                            text: $fName
                        )
                        .disableAutocorrection(true)
                        .padding()
                        .textInputAutocapitalization(.never)
                        TextField(
                            "Last Name",
                            text: $lName
                        )
                        .disableAutocorrection(true)
                        .padding()
                        .textInputAutocapitalization(.never)
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
                        /*
                         TextField(
                         "Confirm Password",
                         text: $confirmPassword
                         )
                         .disableAutocorrection(true)
                         */
                        
                    } .offset(y: -80)
                    .textFieldStyle(.roundedBorder)
                    .foregroundColor(.gray)
                    
                    List {
                        Picker("Type of Account", selection: $selectedAccount) {
                            ForEach(userRoles, id: \.self) {
                                                Text($0)
                                            }
                        }
                        .pickerStyle(.segmented)
                        
                    }
                    
                    ZStack { // Confirm Button
                        RoundedRectangle(cornerRadius: 25)
                            .fill(.blue)
                            .frame(width: 200, height: 50)
                        /*
                            .navigationDestination(isPresented: $signInSuccess) {
                                FeedView()
                            }
    */
                        Button {
                            register()
                            self.goToLogin.toggle()
                        } label: {
                            Text("Confirm")
                                .font(Font.title3)
                                .foregroundColor(.white)
                        }
                    }
                
                    .navigationDestination(isPresented: $goToLogin) {
                        LoginView()
                    } 
                    Spacer()
                }
            }
            .navigationBarBackButtonHidden(true)
        }
        
        
        func register() {
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if error != nil {
                    print(error!.localizedDescription)
                }
                print("Successfully register user: \(result?.user.uid ?? "")")
                
                let db = Firestore.firestore()
                db.collection("Users").document(result!.user.uid).setData([
                    "firstName" : fName,
                    "lastName" : lName,
                    "userName" : Username,
                    "accountType" : selectedAccount
                ])
                { err in
                    if let err = err {
                        print("Error writing document: \(err)")
                    } else {
                        print("Document successfully written!")
                    }
                }
                
            }
            self.signInSuccess.toggle()
        }
    
    func goBack() {
        self.wrongButton.toggle()
    }
    
}

func createAccount(newAccount: Profile, newDoc: String) {
    let db = Firestore.firestore()
    db.collection("Users").document(newDoc).setData([
        "firstName" : newAccount.firstName,
        "lastName" : newAccount.lastName,
        "accountType" : newAccount.role
    ])
    { err in
        if let err = err {
            print("Error writing document: \(err)")
        } else {
            print("Document successfully written!")
        }
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}

