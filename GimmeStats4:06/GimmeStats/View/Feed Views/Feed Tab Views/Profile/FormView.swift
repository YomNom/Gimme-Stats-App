//
//  FormView.swift
//  GimmeStats
//
//  Created by Joey Yong on 4/11/23.
//

import SwiftUI
import Firebase

struct FormView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var image = UIImage()
    
    var body: some View {
        List() {
            ForEach(dataManager.userProfiles, id: \.self) { profile in
                HStack {
                    VStack(alignment: .leading ) {
                        Image(uiImage: self.image)
                            .resizable()
                            .cornerRadius(50)
                            .frame(width: 100, height: 100)
                            .background(Color.black.opacity(0.2))
                            .aspectRatio(contentMode: .fill)
                            .clipShape(Circle())
                            .padding(5)
                    }
                    .frame(maxHeight: .infinity, // Full Screen Height
                           alignment: .topLeading) // Align To top
                    
                    Text(profile.firstName).font(.title2).bold()
                    Text(profile.lastName).font(.title2).bold()
                }
                HStack {
                    Text("Role:")
                    Spacer()
                    Text(profile.role).foregroundColor(.secondary)
                }
            } 
        }
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
            .environmentObject(DataManager())
    }
}
