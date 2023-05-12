//
//  Tennis.swift
//  GimmeStats
//
//  Created by Christina Duvall on 11/20/22.
//

import SwiftUI
import Firebase

struct tennisStat: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var eventNameTennis: String
    var locationTennis: String
    var eventDateTennis: String
    var categoryTennis: String
    var resultInEventTennis: String
    var aces: String
    var doubleFaults: String
    var firstServePercentage: String
    var winPercentageOnFirstServe: String
    var secondServePercentage: String
    var winPercentageOnSecondServe: String
    var breakPointRatio: String
    var tiebreaksWon: String
    var recievingPointsWon: String
    var maxGamesWonInARow: String
    var serviceGamesWon: String
}

struct Tennis: View {
    
    @Environment(\.dismiss) var dismiss
    
    let name: String
 
    @State private var eventNameTennis: String = ""
    @State private var locationTennis: String = ""
    @State private var eventDateTennis: String = "" // picker prob
    @State private var categoryTennis: String = "" // list
    @State private var resultInEventTennis: String = ""
    @State private var aces: String = ""
    @State private var doubleFaults: String = ""
    @State private var firstServePercentage: String = ""
    @State private var winPercentageOnFirstServe: String = ""
    @State private var secondServePercentage: String = ""
    @State private var winPercentageOnSecondServe: String = ""
    @State private var breakPointRatio: String = ""
    @State private var tiebreaksWon: String = ""
    @State private var recievingPointsWon: String = ""
    @State private var maxGamesWonInARow: String = ""
    @State private var serviceGamesWon: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Tennis Statistics")
                    .frame(height: 100)
                    .foregroundColor(.blue)
                    .font(.title3)
                
                VStack {
                    TextField(
                        "Event Name",
                        text: $eventNameTennis
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Location",
                        text: $locationTennis
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Event Date(s)",
                        text: $eventDateTennis
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Singles and or Doubles",
                        text: $categoryTennis
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Result in Event (if applicable)",
                        text: $resultInEventTennis
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Number of Aces",
                        text: $aces
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Number of Double Faults",
                        text: $doubleFaults
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "First Serve Percentage",
                        text: $firstServePercentage
                    )
                    .disableAutocorrection(true)
                }
                VStack {
                    TextField(
                        "Win Percentage on First Serve",
                        text: $winPercentageOnFirstServe
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Second Serve percentage",
                        text: $secondServePercentage
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Win Percentage on Second Serve",
                        text: $winPercentageOnSecondServe
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Break Point Ratio",
                        text: $breakPointRatio
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Tiebreaks Won",
                        text: $tiebreaksWon
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Recieving Points Won",
                        text: $recievingPointsWon
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Max. Games Won In a Row",
                        text: $maxGamesWonInARow
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Service Games Won",
                        text: $serviceGamesWon
                    )
                    .disableAutocorrection(true)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(.blue)
                            .frame(width: 200, height: 50)
                        /*NavigationLink(destination: FeedView(), isActive: $signInSuccess) { EmptyView()}
                         */
                        
                        Button {
                            let tempTennisStat = tennisStat(eventNameTennis: eventNameTennis, locationTennis: locationTennis, eventDateTennis: eventDateTennis, categoryTennis: categoryTennis, resultInEventTennis: resultInEventTennis, aces: aces, doubleFaults: doubleFaults, firstServePercentage: firstServePercentage, winPercentageOnFirstServe: winPercentageOnFirstServe, secondServePercentage: secondServePercentage, winPercentageOnSecondServe: winPercentageOnSecondServe, breakPointRatio: breakPointRatio, tiebreaksWon: tiebreaksWon, recievingPointsWon: recievingPointsWon, maxGamesWonInARow: maxGamesWonInARow, serviceGamesWon: serviceGamesWon)
                            createTennisStat(newTennisStat: tempTennisStat)
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

func createTennisStat(newTennisStat: tennisStat) {
    let handle = Auth.auth().addStateDidChangeListener { auth, user in
        if Auth.auth().currentUser != nil {
            let user = Auth.auth().currentUser
            if let user = user {
                let db = Firestore.firestore()
                db.collection("Stats").document("Tennis").collection(user.uid).document().setData([
                    "eventNameTennis" : newTennisStat.eventNameTennis,
                    "locationTennis" : newTennisStat.locationTennis,
                    "eventDateTennis" : newTennisStat.eventDateTennis,
                    "categoryTennis" : newTennisStat.categoryTennis,
                    "resultInEventTennis" : newTennisStat.resultInEventTennis,
                    "aces" : newTennisStat.aces,
                    "doubleFaults" : newTennisStat.doubleFaults,
                    "firstServePercentage" : newTennisStat.firstServePercentage,
                    "winPercentageOnFirstServe" : newTennisStat.winPercentageOnFirstServe,
                    "breakPointRatio" : newTennisStat.breakPointRatio,
                    "tiebreaksWon" : newTennisStat.tiebreaksWon,
                    "recievingPointsWon" : newTennisStat.recievingPointsWon,
                    "maxGamesWonInARow" : newTennisStat.maxGamesWonInARow,
                    "serviceGamesWon" : newTennisStat.serviceGamesWon
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


/*
struct Tennis_Previews: PreviewProvider {
    static var previews: some View {
        Tennis(name: sport)
    }
}
*/
