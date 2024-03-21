//
//  Golf.swift
//  GimmeStats
//
//  Created by Christina Duvall on 4/17/23.
//

import SwiftUI
import Firebase

struct golfStat: Identifiable {
    var id: String = UUID().uuidString
    var eventNameGolf: String
    var locationGolf: String
    var eventDateGolf: String
    var resultInEventGolf: String
    var lowRound: String
    var mostSubHoles: String
    var firstRoundAvg: String
    var lastRoundAvg: String
    var par3Scoring: String
    var par4Scoring: String
    var par5Scoring: String
    var eagles: String
    var birdies: String
    var subparStrokesPerRound: String
    var parsPerRound: String
    var bogeysPerRound: String
    var dbBogeysPerRound: String
    var fairways: String
    var greensInRegulation: String
    var putts: String
}

struct Golf: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var eventNameGolf: String = ""
    @State private var locationGolf: String = ""
    @State private var eventDateGolf: String = ""
    @State private var resultInEventGolf: String = ""
    @State private var lowRound: String = ""
    @State private var mostSubHoles: String = ""
    @State private var firstRoundAvg: String = ""
    @State private var lastRoundAvg: String = ""
    @State private var par3Scoring: String = ""
    @State private var par4Scoring: String = ""
    @State private var par5Scoring: String = ""
    @State private var eagles: String = ""
    @State private var birdies: String = ""
    @State private var subparStrokesPerRound: String = ""
    @State private var parsPerRound: String = ""
    @State private var bogeysPerRound: String = ""
    @State private var dbBogeysPerRound: String = ""
    @State private var fairways: String = ""
    @State private var greensInRegulation: String = ""
    @State private var putts: String = ""
    
    
    var body: some View {
        
        ScrollView {
            VStack {
                Text("Golf Statistics")
                    .frame(height: 100)
                    .foregroundColor(.blue)
                    .font(.title3)
                
                VStack {
                    TextField(
                        "Event Name",
                        text: $eventNameGolf
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Location",
                        text: $locationGolf
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Event Date(s)",
                        text: $eventDateGolf
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Result in Event (if applicable)",
                        text: $resultInEventGolf
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Low Round",
                        text: $lowRound
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Most Sub Holes",
                        text: $mostSubHoles
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "First Round Average",
                        text: $firstRoundAvg
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Last Round Average",
                        text: $lastRoundAvg
                    )
                    .disableAutocorrection(true)
                }
                VStack {
                    TextField(
                        "Par 3 Scoring",
                        text: $par3Scoring
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Par 4 Scoring",
                        text: $par4Scoring
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Par 5 Scoring",
                        text: $par5Scoring
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Eagles",
                        text: $eagles
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Birdies",
                        text: $birdies
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Subpar Strokes Per Round",
                        text: $subparStrokesPerRound
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Pars Per Round",
                        text: $parsPerRound
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Bogeys Per Round",
                        text: $bogeysPerRound
                    )
                    .disableAutocorrection(true)
                }
                VStack {
                    TextField(
                        "Double Bogeys Per Round",
                        text: $dbBogeysPerRound
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Fairways",
                        text: $fairways
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Greens In Regulation",
                        text: $greensInRegulation
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Putts",
                        text: $putts
                    )
                    .disableAutocorrection(true)
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(.blue)
                            .frame(width: 200, height: 50)
                        /*NavigationLink(destination: FeedView(), isActive: $signInSuccess) { EmptyView()}
                         */
                        
                        Button {
                            let tempGolfStat = golfStat(eventNameGolf: eventNameGolf, locationGolf: locationGolf, eventDateGolf: eventDateGolf, resultInEventGolf: resultInEventGolf, lowRound: lowRound, mostSubHoles: mostSubHoles, firstRoundAvg: firstRoundAvg, lastRoundAvg: lastRoundAvg, par3Scoring: par3Scoring, par4Scoring: par4Scoring, par5Scoring: par5Scoring, eagles: eagles, birdies: birdies, subparStrokesPerRound: subparStrokesPerRound, parsPerRound: parsPerRound, bogeysPerRound: bogeysPerRound, dbBogeysPerRound: dbBogeysPerRound, fairways: fairways, greensInRegulation: greensInRegulation, putts: putts )
                            createGolfStat(newGolfStat: tempGolfStat)
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

func createGolfStat(newGolfStat: golfStat) {
    let handle = Auth.auth().addStateDidChangeListener { auth, user in
        if Auth.auth().currentUser != nil {
            let user = Auth.auth().currentUser
            if let user = user {
                let db = Firestore.firestore()
                db.collection("Stats").document("Golf").collection(user.uid).document().setData([
                    "eventNameGolf" : newGolfStat.eventNameGolf,
                    "locationGolf" : newGolfStat.locationGolf,
                    "eventDateGolf" : newGolfStat.eventDateGolf,
                    "resultInEventGolf" : newGolfStat.resultInEventGolf,
                    "lowRound" : newGolfStat.lowRound,
                    "mostSubHoles" : newGolfStat.mostSubHoles,
                    "firstRoundAvg" : newGolfStat.firstRoundAvg,
                    "lastRoundAvg" : newGolfStat.lastRoundAvg,
                    "par3Scoring" : newGolfStat.par3Scoring,
                    "par4Scoring" : newGolfStat.par4Scoring,
                    "par5Scoring" : newGolfStat.par5Scoring,
                    "eagles" : newGolfStat.eagles,
                    "birdies" : newGolfStat.birdies,
                    "subparStrokesPerRound" : newGolfStat.subparStrokesPerRound,
                    "parsPerRound" : newGolfStat.parsPerRound,
                    "bogeysPerRound" : newGolfStat.bogeysPerRound,
                    "dbBogeysPerRound" : newGolfStat.dbBogeysPerRound,
                    "fairways" : newGolfStat.fairways,
                    "greensInRegulation" : newGolfStat.greensInRegulation,
                    "putts" : newGolfStat.putts
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


struct Golf_Previews: PreviewProvider {
    static var previews: some View {
        Golf()
    }
}
