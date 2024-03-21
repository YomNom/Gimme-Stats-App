//
//  ResetPassword.swift
//  GimmeStats
//
//  Created by Christina Duvall on 1/22/23.
//

import SwiftUI
import FirebaseAuth
import CryptoKit
import AuthenticationServices

struct ResetPassword: View {
    @State var user: GimmeStatsViewModel = GimmeStatsViewModel()
    @State var email: String = ""
    
    @State private var showAlert = false
    @State private var errString: String?
    
    
   // let placeholder: String
    //let keyboardType: UIKeyboardType
    //let sfSymbol: String?
    
    //private let textFieldLeading: CGFloat = 30
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        NavigationView {
            VStack(spacing: 16) {
                TextField(
                    "Email",
                    text: $email
                )
                .textFieldStyle(.roundedBorder)
                .foregroundColor(.gray)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.blue)
                        .frame(width: 200, height: 50)
                    /*NavigationLink(destination: FeedView(), isActive: $signInSuccess) { EmptyView()}
                    */
                    
                    Button {
                        ResetPassword.resetPassword(email: self.email) { (result) in
                            switch result {
                            case .failure(let error):
                                self.errString = error.localizedDescription
                            case .success( _):
                                break
                            }
                            self.showAlert = true
                            
                        }
                    } label: {
                        Text("Send Password Reset")
                            .font(Font.title3)
                            .foregroundColor(.white)
                        
                    }

                }
                    
            }
            .padding(.horizontal, 15)
            .navigationTitle("Reset Password")
            
        } /*
        .alert(sheet(isPresented: $showAlert) {
            Alert(title: Text("Password Reset"),
                  message: Text(self.errString ?? "Success. Reset email sent Successfully. Check your email"),
                  dismissButton: .default(Text("OK"))) {
                self.presentationMode.wrappedValue.dismiss()
        }) */
        
    }
    static func resetPassword(email: String, resetCompletion: @escaping (Result<Bool,Error>) -> Void) {
        Auth.auth().sendPasswordReset(withEmail:email, completion: { (error) in if let error = error {
            resetCompletion(.failure(error))
        } else {
            resetCompletion(.success(true))
        }
        })
    }
}

struct ResetPassword_Previews: PreviewProvider {
    static var previews: some View {
        ResetPassword(email: "")
                     /*keyboardType: .emailAddress,
                      sfSymbol: "envelope"*/
        .previewLayout(.sizeThatFits)
        .previewDisplayName("Reset Password")
        .padding()
    }
}
