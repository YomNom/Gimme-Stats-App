//
//  Lacrosse.swift
//  GimmeStats
//
//  Created by Christina Duvall on 11/21/22.
//

import SwiftUI
import Firebase

struct laxStat: Identifiable {
    var id: String = UUID().uuidString
    var eventNameLax: String
    var locationLax: String
    var eventDateLax: String
    var resultInEventLax: String
    var goalsLax: String
    var assistsLax: String
    var groundBalls: String
    var shotsLax: String
    var turnoversLax: String
    var causedTurnoversLax: String
}

struct Lacrosse: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var eventNameLax: String = ""
    @State private var locationLax: String = ""
    @State private var eventDateLax: String = "" // picker prob
    @State private var resultInEventLax: String = ""
    @State private var goalsLax: String = ""
    @State private var assistsLax: String = ""
    @State private var groundBalls: String = ""
    @State private var shotsLax: String = ""
    @State private var turnoversLax: String = ""
    @State private var causedTurnoversLax: String = ""
    
    
    var body: some View {
        VStack {
            Text("Lacrosse Statistics")
                .frame(height: 100)
                .foregroundColor(.blue)
                .font(.title3)
            
            VStack {
                TextField(
                    "Event Name",
                    text: $eventNameLax
                )
                .disableAutocorrection(true)
                TextField(
                    "Location",
                    text: $locationLax
                )
                .disableAutocorrection(true)
                TextField(
                    "Event Date(s)",
                    text: $eventDateLax
                )
                .disableAutocorrection(true)
                TextField(
                    "Result in Event (if applicable)",
                    text: $resultInEventLax
                )
                .disableAutocorrection(true)
                TextField(
                    "Number of Goals",
                    text: $goalsLax
                )
                .disableAutocorrection(true)
                TextField(
                    "Number of Assists",
                    text: $assistsLax
                )
                .disableAutocorrection(true)
                TextField(
                    "Number of Ground Balls",
                    text: $groundBalls
                )
                .disableAutocorrection(true)
            }
            VStack {
                TextField(
                    "Number of Shots Taken",
                    text: $shotsLax
                )
                .disableAutocorrection(true)
                TextField(
                    "Number of Turnovers",
                    text: $turnoversLax
                )
                .disableAutocorrection(true)
                TextField(
                    "Number of Cause Turnovers",
                    text: $causedTurnoversLax
                )
                .disableAutocorrection(true)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.blue)
                        .frame(width: 200, height: 50)
                    /*NavigationLink(destination: FeedView(), isActive: $signInSuccess) { EmptyView()}
                     */
                    
                    Button {
                        let tempLaxStat = laxStat(eventNameLax: eventNameLax, locationLax: locationLax, eventDateLax: eventDateLax, resultInEventLax: resultInEventLax, goalsLax: goalsLax, assistsLax: assistsLax, groundBalls: groundBalls, shotsLax: shotsLax, turnoversLax: turnoversLax, causedTurnoversLax: causedTurnoversLax)
                        createLaxStat(newLaxStat: tempLaxStat)
                        dismiss()
                    } label: {
                        Text("Confirm")
                            .font(Font.title3)
                            .foregroundColor(.white)
                        
                    }
                    
                }
                
            }
        }
            .textFieldStyle(.roundedBorder)
            .foregroundColor(.gray)
            .padding()
            .offset(y: 25)
    }
}

func createLaxStat(newLaxStat: laxStat) {
    let handle = Auth.auth().addStateDidChangeListener { auth, user in
        if Auth.auth().currentUser != nil {
            let user = Auth.auth().currentUser
            if let user = user {
                let db = Firestore.firestore()
                db.collection("Stats").document("Lacrosse").collection(user.uid).document().setData([
                    "eventNameLax" : newLaxStat.eventNameLax,
                    "locationLax" : newLaxStat.locationLax,
                    "eventDateLax" : newLaxStat.eventDateLax,
                    "resultInEventLax" : newLaxStat.resultInEventLax,
                    "goalsLax" : newLaxStat.goalsLax,
                    "assistsLax" : newLaxStat.assistsLax,
                    "groundBalls" : newLaxStat.groundBalls,
                    "shotsLax" : newLaxStat.shotsLax,
                    "turnoversLax" : newLaxStat.turnoversLax,
                    "causedTurnoversLax" : newLaxStat.causedTurnoversLax
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

struct Lacrosse_Previews: PreviewProvider {
    static var previews: some View {
        Lacrosse()
    }
}

