//
//  ProfileView.swift
//  GimmeStats
//
//  Created by Joey Yong on 11/17/22.
//
import SwiftUI
import MapKit
import Firebase
import Combine

//year in school, description/bio, GPA, Position, Sport
struct Profile: Identifiable, Hashable{
    var id: String = UUID().uuidString
    var firstName: String
    var lastName: String
    var userName: String
    var bio: String
    var currentYear: String
    var pronouns: String
    var GPA: String
    var sport: String
    var position: String
    var role: String
}

struct ProfileView: View {
    @State var profile: Profile
    @State var mode: EditMode = .inactive
    @State private var image = UIImage()
    @State private var showCamera = false
    @State private var showPhotoLibrary = false
    @Namespace private var namespace
    @EnvironmentObject var dataManager: DataManager
    
    var body: some View {
            NavigationView {
                Group {
                    if mode.isEditing {
                        editFormView()
                            .onAppear {
                                resetProfile()
                            }
                    } else {
                        let _ = updateUser(userInfo: profile)
                        let _ = dataManager.fetchCurrentUser()
                        formView()
                    }
                }
                .navigationTitle("Profile")
                .navigationBarItems(trailing: EditButton())
                .environment(\.editMode, self.$mode)
            }
            .refreshable {
                dataManager.fetchCurrentUser()
            }
            
    }
    
    //Function to keep text length in limits
    func limitBioText(_ upper: Int) {
        if self.profile.bio.count > upper {
            self.profile.bio = String(self.profile.bio.prefix(upper))
        }
    }
    
    func resetProfile() {
        self.profile = Profile(firstName: "", lastName: "", userName: "", bio: "", currentYear: "", pronouns: "", GPA: "", sport: "", position: "", role: "")
    }
    
    fileprivate func formView() -> some View {
        let user = Auth.auth().currentUser
        return Form {
            List() {
                ForEach(dataManager.currentProfile, id: \.self) { profile in
                    HStack {
                        VStack(alignment: .leading ) {
                            Image(uiImage: self.image)
                                .resizable()
                                .cornerRadius(50)
                                .frame(width: 90, height: 90)
                                .background(Color.black.opacity(0.2))
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                                .padding(5)
                        }
                        .frame(maxHeight: .infinity, // Full Screen Height
                               alignment: .topLeading) // Align To top
                        
                        Text(profile.firstName).font(.title2).bold()
                        Text(profile.lastName).font(.title2).bold()
                    } //HStack
                    HStack {
                        Text("Role:")
                        Text(profile.role).foregroundColor(.secondary)
                        Spacer()
                        Text(profile.pronouns)
                    }
                    HStack {
                        Text("Sport:")
                        Text(profile.sport).foregroundColor(.secondary)
                        Spacer()
                        Text("Position: ")
                        Text(profile.position).foregroundColor(.secondary)
                    }
                    HStack {
                        Text("Year in Education: ")
                        Text(profile.currentYear).foregroundColor(.secondary)
                        Spacer()
                        Text("GPA: \(profile.GPA)")
                    }
                    HStack {
                        Button {
                            let _ = getEmail()
                        } label: {
                            HStack{
                                Image(systemName: "doc.on.doc")
                                //Text("\(userEmail)")
                            }
                            .frame(width: 40, height: 40)
                            .background(Color.blue.opacity(0.2))
                            .clipShape(Circle())
                        }
                        Text("\(user?.email ?? "")")
                    }
                    HStack {
                        Text("BIO\n").font(.title3).bold()
                        Text("\(profile.bio)")
                    }
                }
            }
        }
    }

    fileprivate func editFormView() -> some View {
        return Form {
            let userRoles = ["Coach", "Athlete"]
            let sportsChoice = ["Baseball", "Basketball", "Golf", "Lacrosse", "Soccer", "Softball", "Tennis"]
            let textLimit = 64
            VStack {
                Image(uiImage: self.image)
                    .resizable()
                    .cornerRadius(50)
                    .padding(.all, 1)
                    .frame(width: 100, height: 100)
                    .background(Color.black.opacity(0.2))
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .padding(8)
                HStack {
                    ZStack { // Camera Button
                        RoundedRectangle(cornerRadius: 25)
                            .fill(.gray)
                            .frame(width: 150, height: 35)
                            .padding(3)
                        Text("CAMERA")
                            .font(.system(size: 15))
                            .frame(height: 18)
                            .cornerRadius(5)
                            .padding(.horizontal, 20)
                            .foregroundColor(.black)
                            .bold()
                            .onTapGesture {
                                showCamera = true
                            }
                            .sheet(isPresented: $showCamera) {
                                ImagePicker(sourceType: .camera, selectedImage: self.$image)
                            }
                    }
                    
                    ZStack { // Photo Library Button
                        RoundedRectangle(cornerRadius: 25)
                            .fill(.gray)
                            .frame(width: 150, height: 35)
                            .padding(3)
                        Text("PHOTO LIBRARY")
                            .font(.system(size: 13))
                            .cornerRadius(5)
                            .padding(.horizontal, 20)
                            .foregroundColor(.black)
                            .bold()
                            .onTapGesture {
                                showPhotoLibrary = true
                            }
                            .sheet(isPresented: $showPhotoLibrary) {
                                ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
                            }
                    }
                }
            }
            Section(header: Text("Name")) {
                TextField("First Name",text: $profile.firstName)
                TextField("Last Name",text: $profile.lastName)
            }
            Section(header: Text("Pronouns")) {
                TextField("",text: $profile.pronouns)
            }
            Section(header: Text("Year of Education")) {
                TextField("",text: $profile.currentYear)
            }
            Section(header: Text("GPA")) {
                TextField("",text: $profile.GPA)
            }
            Section(header: Text("Bio")) {
                TextField("Introduce Yourself!",text: $profile.bio).onReceive(Just(profile.bio)) { _ in limitBioText(textLimit) }
            }
            Section(header: Text("Role")) {
                //TextField("Role",text: $profile.role)
                Picker("Type of Account", selection: $profile.role) {
                    ForEach(userRoles, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                
            }
            
            Picker("SPORT", selection: $profile.sport) {
                ForEach(sportsChoice, id: \.self) {
                    Text($0)
                }
            }
            .foregroundColor(.gray)
            
            Section(header: Text("Sports Position")) {
                TextField("",text: $profile.position)
            }
        }
    } // editFormView
    
    // Purpose: retrieve email to allow user to copy paste
    // Source: https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&ved=2ahUKEwjpqZqGs7r-AhVbpIkEHXITAsIQFnoECA4QAQ&url=https%3A%2F%2Fwww.hackingwithswift.com%2Fexample-code%2Fsystem%2Fhow-to-copy-text-to-the-clipboard-using-uipasteboard&usg=AOvVaw2QvVPMYk6EIXpfMWZfJJwG
    func getEmail() {
        let user = Auth.auth().currentUser
        let pasteboard = UIPasteboard.general
        pasteboard.string = user?.email
        if let pastedText = pasteboard.string {
            // text was found and placed in the "string" constant
            print("Pasted text: \(pastedText)")
        }
            
    }
}

func updateUser(userInfo: Profile) {
    let user = Auth.auth().currentUser
    if let user = user {
        let _ = updateData(docName: user.uid, dataName: "firstName", inputData: userInfo.firstName)
        let _ = updateData(docName: user.uid, dataName: "lastName", inputData: userInfo.lastName)
        let _ = updateData(docName: user.uid, dataName: "bio", inputData: userInfo.bio)
        let _ = updateData(docName: user.uid, dataName: "currentYear", inputData: userInfo.currentYear)
        let _ = updateData(docName: user.uid, dataName: "pronouns", inputData: userInfo.pronouns)
        let _ = updateData(docName: user.uid, dataName: "GPA", inputData: userInfo.GPA)
        let _ = updateData(docName: user.uid, dataName: "sport", inputData: userInfo.sport)
        let _ = updateData(docName: user.uid, dataName: "position", inputData: userInfo.position)
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

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(profile: Profile(firstName: "", lastName: "", userName: "", bio: "", currentYear: "", pronouns: "", GPA: "", sport: "", position: "", role: ""))
            .environmentObject(DataManager())
    }
}

// Purpose: UI for choosing a profile picture
// Source: https://designcode.io/swiftui-advanced-handbook-imagepicker
struct ImagePicker: UIViewControllerRepresentable {
    @Environment(\.presentationMode) private var presentationMode
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @Binding var selectedImage: UIImage

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {

        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator

        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {

    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

        var parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.selectedImage = image
            }

            parent.presentationMode.wrappedValue.dismiss()
        }

    }
}


