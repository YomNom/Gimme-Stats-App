//
//  Message.swift
//  GimmeStats
//
//  Created by Joey Yong on 11/17/22.
//

import SwiftUI

struct Message: View {
    
    @State private var newMessage = false
    
    var body: some View {
        NavigationStack {
            VStack {
                /*
                .navigationBarItems(trailing: Button(action: {
                    self.newMessage.toggle()
                    
                }, label: {
                    Image(systemName: "plus")
                }))*/
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.white)
                        .frame(width: 45, height: 40)
                    Button {
                        self.newMessage.toggle()
                    } label: {
                        Label("", systemImage: "plus")
                            .foregroundColor(.blue)
                            .sheet(isPresented: $newMessage) {
                                ChatView()
                                    .navigationBarBackButtonHidden()
                            }
                    }
                }
                .offset(x: 150, y: -300)
                Text("Messages!")
                .navigationTitle("Messages")
                /*
                .sheet(isPresented: $newMessage) {
                    ChatView()
                         }*/
            }
            
        }
    }
}

struct Message_Previews: PreviewProvider {
    static var previews: some View {
        Message().navigationBarHidden(false)
    }
}
