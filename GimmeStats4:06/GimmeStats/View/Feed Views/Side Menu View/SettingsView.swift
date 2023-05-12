//
//  SettingsView.swift
//  GimmeStats
//
//  Created by Dylan Mordhorst on 2/6/23.
//

import SwiftUI
import Firebase

struct SettingsView: View {
    @State private var ShowNotifications = true
    @State private var textNotification = true
    @State private var emailNotification = true
    
    var body: some View {
        NavigationView{
            VStack(alignment: .center){
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(red: 245/255, green: 245/255 , blue: 245/255))
                    .frame(width: 375, height: 150)
                
                Toggle("Notifications: ", isOn: $ShowNotifications)
                    .frame(width: 350,height: 0)
                    .offset(x: 0, y: 0)
                    .padding(.top, -125)
                
                
                if ShowNotifications {
                    //Allows notifications
                    Toggle("Text Notifications: ", isOn: $textNotification)
                        .frame(width: 300,height:0)
                        .offset(x: 25, y: 0)
                        .padding(.top, -95)
                    Toggle("Email Notifications: ", isOn: $emailNotification)
                        .frame(width: 300,height: 0)
                        .offset(x: 25, y: 0)
                        .padding(.top , -65)
                    
                }
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(red: 245/255, green: 245/255 , blue: 245/255))
                    .frame(width: 375, height: 50)
               
                    Text("Delete Account")
                        .font(Font.title3)
                        .foregroundColor(.red)
                        .padding(.top, -45)
                        .onTapGesture {
                            deleteAccount()
                        }
                
            } .offset(y: -200)
                
                .navigationTitle("Settings")
            }
        }
    }
    
func deleteAccount() {
    let user = Auth.auth().currentUser
    user?.delete { error in
      if let error = error {
        // An error happened.
          print(error.localizedDescription)
          print("Deletion Unsuccessful")
      } else {
        // Account deleted.
        print("Account Deletion Successful")
          deleteDoc(collectionName: "Users", docName: user!.uid )
      }
    }
}

func deleteDoc(collectionName: String, docName: String) {
    Firestore.firestore().collection(collectionName).document(docName).delete() { err in
        if let err = err {
            print("Error removing document: \(err)")
        } else {
            print("Document successfully removed!")
        }
    }
}
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

