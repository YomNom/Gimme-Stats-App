//
//  EditFormView.swift
//  GimmeStats
//
//  Created by Joey Yong on 4/11/23.
//

import SwiftUI
import Firebase

struct EditFormView: View {
    @State var profile: Profile
    var body: some View {
        let user = Auth.auth().currentUser
        if let user = user {
            VStack {
                Section(header: Text("First name")) {
                    TextField("First Name",text: $profile.firstName)
                    
                }
                Section(header: Text("Last name")) {
                    TextField("Last Name",text: $profile.lastName)
                    
                }
                Section(header: Text("Role")) {
                    TextField("Role",text: $profile.role)
                }
            }
        }
    }
}

func updateUser(userInfo: Profile) {
    let user = Auth.auth().currentUser
    if let user = user {
        let _ = updateData(docName: user.uid, dataName: "firstName", inputData: userInfo.firstName)
        let _ = updateData(docName: user.uid, dataName: "lastName", inputData: userInfo.lastName)
        let _ = updateData(docName: user.uid, dataName: "accountType", inputData: userInfo.role)
    }
}

func updateData(docName: String, dataName: String, inputData: String) {
    if inputData != "" {
        let db = Firestore.firestore()
        
        let docRef = db.collection("Users").document(docName)
        
        docRef.updateData([dataName: inputData]) { error in
            if let error = error {
                print("Error updating document: \(error)")
            } else {
                print("Document successfully updated!")
            }
        }
    }
}

struct EditFormView_Previews: PreviewProvider {
    static var previews: some View {
        EditFormView( profile: Profile(firstName: "", lastName: "", role: ""))
    }
}
