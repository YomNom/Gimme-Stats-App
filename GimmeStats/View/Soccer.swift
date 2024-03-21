//
//  Soccer.swift
//  GimmeStats
//
//  Created by Christina Duvall on 4/17/23.
//

import SwiftUI
import Firebase

struct soccerStat: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var eventNameSoc: String
    var locationSoc: String
    var eventDateSoc: String
    var resultInEventSoc: String
    var goalsSoc: String
    var shotsTakenSoc: String
    var shotsOnTargetSoc: String
    var assistsSoc: String
    var passesSoc: String
    var goalsAllowedSoc: String
    var goalsSavedSoc: String
    var foulsSoc: String
    var penaltyKicksAllowedSoc: String
    var penaltyKicksSavedSoc: String
    var freeKicksAllowedSoc: String
    var freeKicksSavedSoc: String
}

struct Soccer: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var eventNameSoc: String = ""
    @State private var locationSoc: String = ""
    @State private var eventDateSoc: String = ""
    @State private var resultInEventSoc: String = ""
    @State private var goalsSoc: String = ""
    @State private var shotsTakenSoc: String = ""
    @State private var shotsOnTargetSoc: String = ""
    @State private var assistsSoc: String = ""
    @State private var passesSoc: String = ""
    @State private var goalsAllowedSoc: String = ""
    @State private var goalsSavedSoc: String = ""
    @State private var foulsSoc: String = ""
    @State private var penaltyKicksAllowedSoc: String = ""
    @State private var penaltyKicksSavedSoc: String = ""
    @State private var freeKicksAllowedSoc: String = ""
    @State private var freeKicksSavedSoc: String = ""
    
    
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Soccer Statistics")
                    .frame(height: 100)
                    .foregroundColor(.blue)
                    .font(.title3)
                
                VStack {
                    TextField(
                        "Event Name",
                        text: $eventNameSoc
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Location",
                        text: $locationSoc
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Event Date(s)",
                        text: $eventDateSoc
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Result in Event (if applicable)",
                        text: $resultInEventSoc
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Number of Goals Scored",
                        text: $goalsSoc
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Number of Shots Taken",
                        text: $shotsTakenSoc
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Number of Shots on Target",
                        text: $shotsOnTargetSoc
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Number of Assists",
                        text: $assistsSoc
                    )
                    .disableAutocorrection(true)
                }
                VStack {
                    TextField(
                        "Number of Passes",
                        text: $passesSoc
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Goals Allowed",
                        text: $goalsAllowedSoc
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Goals Saved",
                        text: $goalsSavedSoc
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Fouls Recieved",
                        text: $foulsSoc
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Penalty Kicks Allowed",
                        text: $penaltyKicksAllowedSoc
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Penalty Kicks Saved",
                        text: $penaltyKicksSavedSoc
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Free Kicks Allowed",
                        text: $freeKicksAllowedSoc
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Free Kicks Saved",
                        text: $freeKicksSavedSoc
                    )
                    .disableAutocorrection(true)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(.blue)
                            .frame(width: 200, height: 50)
                        /*NavigationLink(destination: FeedView(), isActive: $signInSuccess) { EmptyView()}
                         */
                        
                        Button {
                            let tempSoccerStat = soccerStat(eventNameSoc: eventNameSoc, locationSoc: locationSoc, eventDateSoc: eventDateSoc, resultInEventSoc: resultInEventSoc, goalsSoc: goalsSoc, shotsTakenSoc: shotsTakenSoc, shotsOnTargetSoc: shotsOnTargetSoc, assistsSoc: assistsSoc, passesSoc: passesSoc, goalsAllowedSoc: goalsAllowedSoc, goalsSavedSoc: goalsSavedSoc, foulsSoc: foulsSoc, penaltyKicksAllowedSoc: penaltyKicksAllowedSoc, penaltyKicksSavedSoc: penaltyKicksSavedSoc, freeKicksAllowedSoc: freeKicksAllowedSoc, freeKicksSavedSoc: freeKicksSavedSoc )
                            createSoccerStat(newSoccerStat: tempSoccerStat)
                            dismiss()
                        } label: {
                            Text("Confirm")
                                .font(Font.title3)
                                .foregroundColor(.white)
                            
                        }
                        
                    }
                    
                }
            }
        
    }
            .textFieldStyle(.roundedBorder)
            .foregroundColor(.gray)
            .padding(20)
            .offset(y: 25)
            
    }
}

func createSoccerStat(newSoccerStat: soccerStat) {
    let handle = Auth.auth().addStateDidChangeListener { auth, user in
        if Auth.auth().currentUser != nil {
            let user = Auth.auth().currentUser
            if let user = user {
                let db = Firestore.firestore()
                db.collection("Stats").document("Soccer").collection(user.uid).document().setData([
                    "eventNameSoc" : newSoccerStat.eventNameSoc,
                    "locationSoc" : newSoccerStat.locationSoc,
                    "eventDateSoc" : newSoccerStat.eventDateSoc,
                    "resultInEventSoc" : newSoccerStat.resultInEventSoc,
                    "goalsSoc" : newSoccerStat.goalsSoc,
                    "shotsTakenSoc" : newSoccerStat.shotsTakenSoc,
                    "shotsOnTargetSoc" : newSoccerStat.shotsOnTargetSoc,
                    "assistsSoc" : newSoccerStat.assistsSoc,
                    "passesSoc" : newSoccerStat.passesSoc,
                    "goalsAllowedSoc" : newSoccerStat.goalsAllowedSoc,
                    "goalsSavedSoc" : newSoccerStat.goalsSavedSoc,
                    "foulsSoc" : newSoccerStat.foulsSoc,
                    "penaltyKicksAllowedSoc" : newSoccerStat.penaltyKicksAllowedSoc,
                    "penaltyKicksSavedSoc" : newSoccerStat.penaltyKicksSavedSoc,
                    "freeKicksAllowedSoc" : newSoccerStat.freeKicksAllowedSoc,
                    "freeKicksSavedSoc" : newSoccerStat.freeKicksSavedSoc
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


struct Soccer_Previews: PreviewProvider {
    static var previews: some View {
        Soccer()
    }
}
