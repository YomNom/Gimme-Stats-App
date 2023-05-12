//
//  HelpPageView.swift
//  GimmeStats
//
//  Created by Dylan Mordhorst on 2/9/23.
//

import SwiftUI


struct HelpPageView: View {
    var body: some View {
        NavigationView{
            VStack{
                VStack{
                    Text("How can I delete my account?")
                        .font(.title2)
                        .offset(x: -35 ,y: 0)
                    Text("open the side menu and go into the settings page. At the bottom you can click the delete account button")
                        .frame(width: 350, height: 70)
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width:500, height:1 )
                    Text("How do I change my profile photo?")
                        .font(.title2)
                        .offset(x: -15 ,y: 0)
                    Text("open the side menu and go into the settings page. At the bottom you can click the delete account button")
                        .frame(width: 350, height: 70)
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width:500, height:1 )
                    Text("How do I make a new post?")
                        .font(.title2)
                        .offset(x: -50 ,y: 0)
                    Text("From your home feed page locate the + in the top right of the page. After clicking the + a sheet should pop up allowing you to select your sport. After clicking on your desired sport fill out the succeeding document")
                        .frame(width: 350, height: 70)
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width:500, height:1 )
                    Text("How do I navigate the app?")
                        .font(.title2)
                        .offset(x: -50 ,y: 0)
                    
                }
                Text("The buttons on the bottom of your screen allow you to access your profile, your feed, messages, and calendar")
                    .frame(width: 350, height: 70)
            }
            .navigationTitle("FAQ:")

        }
    }
}

struct HelpPageView_Previews: PreviewProvider {
    static var previews: some View {
        HelpPageView()
    }
}
