//
//  Basketball.swift
//  GimmeStats
//
//  Created by Christina Duvall on 4/17/23.
//

import SwiftUI
import Firebase

struct basketballStat: Identifiable {
    var id: String = UUID().uuidString
    var eventNameBB: String
    var locationBB: String
    var eventDateBB: String
    var resultInEventBB: String
    var totalPointsBB: String
    var fgMadeAttemptedBB: String
    var fgPercentageBB: String
    var tpMadeAttemptedBB: String
    var tpPercentageBB: String
    var ftMadeAttemptedBB: String
    var ftPercentageBB: String
    var reboundsBB: String
    var assistsBB: String
    var turnoversBB: String
    var pointsOffTurnoversBB: String
    var stealsBB: String
    var blocksBB: String
}

struct Basketball: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var eventNameBB: String = ""
    @State private var locationBB: String = ""
    @State private var eventDateBB: String = ""
    @State private var resultInEventBB: String = ""
    @State private var totalPointsBB: String = ""
    @State private var fgMadeAttemptedBB: String = ""
    @State private var fgPercentageBB: String = ""
    @State private var tpMadeAttemptedBB: String = ""
    @State private var tpPercentageBB: String = ""
    @State private var ftMadeAttemptedBB: String = ""
    @State private var ftPercentageBB: String = ""
    @State private var reboundsBB: String = ""
    @State private var assistsBB: String = ""
    @State private var turnoversBB: String = ""
    @State private var pointsOffTurnoversBB: String = ""
    @State private var stealsBB: String = ""
    @State private var blocksBB: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Basketball Statistics")
                    .frame(height: 100)
                    .foregroundColor(.blue)
                    .font(.title3)
                
                VStack {
                    TextField(
                        "Event Name",
                        text: $eventNameBB
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Location",
                        text: $locationBB
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Event Date(s)",
                        text: $eventDateBB
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Result in Event (if applicable)",
                        text: $resultInEventBB
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Total Points",
                        text: $totalPointsBB
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Field Goals Made-Attempted (i.e. 4-8)",
                        text: $fgMadeAttemptedBB
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Field Goal Percentage",
                        text: $fgPercentageBB
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "3-Point Made-Attempted (i.e. 2-3)",
                        text: $tpMadeAttemptedBB
                    )
                    .disableAutocorrection(true)
                }
                VStack {
                    TextField(
                        "3-Point Percentage",
                        text: $tpPercentageBB
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Free Throws Made-Attempted (i.e. 0-3)",
                        text: $ftMadeAttemptedBB
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Free Throw Percentage",
                        text: $ftPercentageBB
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Rebounds",
                        text: $reboundsBB
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Assists",
                        text: $assistsBB
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Turnovers",
                        text: $turnoversBB
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Points Made Off of Turnovers",
                        text: $pointsOffTurnoversBB
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Steals",
                        text: $stealsBB
                    )
                    .disableAutocorrection(true)
                }
                VStack {
                    TextField(
                        "Blocks",
                        text: $blocksBB
                    )
                    .disableAutocorrection(true)
                
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(.blue)
                            .frame(width: 200, height: 50)
                        /*NavigationLink(destination: FeedView(), isActive: $signInSuccess) { EmptyView()}
                         */
                        
                        Button {
                            let tempBasketballStat = basketballStat(eventNameBB: eventNameBB, locationBB: locationBB, eventDateBB: eventDateBB, resultInEventBB: resultInEventBB, totalPointsBB: totalPointsBB, fgMadeAttemptedBB: fgMadeAttemptedBB, fgPercentageBB: fgPercentageBB, tpMadeAttemptedBB: tpMadeAttemptedBB, tpPercentageBB: tpPercentageBB, ftMadeAttemptedBB: ftMadeAttemptedBB, ftPercentageBB: ftPercentageBB, reboundsBB: reboundsBB, assistsBB: assistsBB, turnoversBB: turnoversBB, pointsOffTurnoversBB: pointsOffTurnoversBB, stealsBB: stealsBB, blocksBB: blocksBB )
                            createBasketballStat(newBasketballStat: tempBasketballStat)
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

func createBasketballStat(newBasketballStat: basketballStat) {
    let handle = Auth.auth().addStateDidChangeListener { auth, user in
        if Auth.auth().currentUser != nil {
            let user = Auth.auth().currentUser
            if let user = user {
                let db = Firestore.firestore()
                db.collection("Stats").document("Basketball").collection(user.uid).document().setData([
                    "eventNameBB" : newBasketballStat.eventNameBB,
                    "locationBB" : newBasketballStat.locationBB,
                    "eventDateBB" : newBasketballStat.eventDateBB,
                    "resultInEventBB" : newBasketballStat.resultInEventBB,
                    "totalPointsBB" : newBasketballStat.totalPointsBB,
                    "fgMadeAttemptedBB" : newBasketballStat.fgMadeAttemptedBB,
                    "fgPercentageBB" : newBasketballStat.fgPercentageBB,
                    "tpMadeAttemptedBB" : newBasketballStat.tpMadeAttemptedBB,
                    "tpPercentageBB" : newBasketballStat.tpPercentageBB,
                    "ftMadeAttemptedBB" : newBasketballStat.ftMadeAttemptedBB,
                    "ftPercentageBB" : newBasketballStat.ftPercentageBB,
                    "reboundsBB" : newBasketballStat.reboundsBB,
                    "assistsBB" : newBasketballStat.assistsBB,
                    "turnoversBB" : newBasketballStat.turnoversBB,
                    "pointsOffTurnoversBB" : newBasketballStat.pointsOffTurnoversBB,
                    "stealsBB" : newBasketballStat.stealsBB,
                    "blocksBB" : newBasketballStat.blocksBB
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


struct Basketball_Previews: PreviewProvider {
    static var previews: some View {
        Basketball()
    }
}
