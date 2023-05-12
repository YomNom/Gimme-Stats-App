//
//  NewEventTemplate.swift
//  GimmeStats
//
//  Created by Christina Duvall on 2/28/23.
//

import SwiftUI
import Firebase

struct NewEventTemplate: View {
    
    @State private var newEventCreated = false
    @State private var backToCalendar = false
    
    @Environment(\.dismiss) var dismiss
    
    @State private var wrongButton = false
    
    @State private var eventName: String = ""
    @State private var eventStart: String = ""
    @State private var eventEnd: String = ""
    @State private var location: String = ""
    @State private var notifySpectators: String = "" // bill
    @State private var eventsParticipatedIn: String = ""
    
    var body: some View {
        
        VStack {
            Button {
                self.wrongButton.toggle()
            } label: {
                Label("", systemImage: "ellipsis")
                    .navigationDestination(isPresented: $wrongButton) {
                        Message()
                            .navigationBarBackButtonHidden()
                    }
            } .offset(y: -30)
            Text("Create New Event")
                .frame(height: 50)
                .foregroundColor(.blue)
                .font(.title3)
            
            TextField(
                "Event Name",
                text: $eventName
            )
            .disableAutocorrection(true)
            .padding()
            TextField(
                "Event Start",
                text: $eventStart
            )
            .disableAutocorrection(true)
            .padding()
            TextField(
                "Event End",
                text: $eventEnd
            )
            .disableAutocorrection(true)
            .padding()
            TextField(
                "Location",
                text: $location
            )
            .disableAutocorrection(true)
            .padding()
            TextField(
                "Invite Spectators",
                text: $notifySpectators
            )
            .disableAutocorrection(true)
            .padding()
             TextField(
             "Events Participated In",
             text: $eventsParticipatedIn
             )
             .disableAutocorrection(true)
             .padding()
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(.blue)
                    .frame(width: 200, height: 50)
                    .navigationDestination(isPresented: $newEventCreated) {
                        Calendar()
                            .navigationBarBackButtonHidden()
                    }
                
                Button {
                    let tempEvent = Event(eventName: eventName, eventStart: eventStart, eventEnd: eventEnd, location: location, notifySpectators: notifySpectators, eventsParticipatedIn: eventsParticipatedIn)
                    createEvent(newEvent: tempEvent)
                    dismiss()
                    
                } label: {
                    Text("Create Event")
                        .font(Font.title3)
                        .foregroundColor(.white)
                    
                }
                .navigationDestination(isPresented: $backToCalendar) {
                    Calendar()
                        .navigationBarBackButtonHidden()
                }
            
                
            }
        }
        .textFieldStyle(.roundedBorder)
        .foregroundColor(.gray)
        .offset(y: -50)

    }
 
}

func createEvent(newEvent: Event) {
    let handle = Auth.auth().addStateDidChangeListener { auth, user in
        if Auth.auth().currentUser != nil {
            let user = Auth.auth().currentUser
            if let user = user {
                let db = Firestore.firestore()
                db.collection("Calendar").document(user.uid).collection("events").document().setData([
                    "eventName" : newEvent.eventName,
                    "eventStart" : newEvent.eventStart,
                    "eventEnd" : newEvent.eventEnd,
                    "eventLocation" : newEvent.location,
                    "notifySpectators" : newEvent.notifySpectators,
                    "eventsParticipatedIn" : newEvent.eventsParticipatedIn
                ])
                { err in
                    if let err = err {
                        print("Error writing document: \(err)")
                    } else {
                        print("Document successfuly written!")
                    }
                }
            } //verify user
        } // check for signed in user
    } // handle
    Auth.auth().removeStateDidChangeListener(handle)
}

struct NewEventTemplate_Previews: PreviewProvider {
    static var previews: some View {
        NewEventTemplate()
    }
}
