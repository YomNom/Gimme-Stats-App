//
//  Softball.swift
//  GimmeStats
//
//  Created by Christina Duvall on 4/19/23.
//

import SwiftUI
import Firebase

struct softballStat: Identifiable {
    var id: String = UUID().uuidString
    var eventNameSoftball: String
    var locationSoftball: String
    var eventDateSoftball: String
    var resultInEventSoftball: String
    // batting
    var AVGSoftball: String
    var OPSSoftball: String
    var GPGSSoftball: String
    var ABSoftballb: String
    var RSoftballb: String
    var HSoftballb: String
    var doublesSoftballb: String
    var triplesSoftballb: String
    var HRSoftballb: String
    var RBISoftball: String
    var TBSoftball: String
    var SLGPercentageSoftball: String
    var BBSoftballb: String //walks baseball batting
    var HBPSoftballb: String
    var SOSoftballb: String
    var GDPSoftball: String
    var OBPercentageSoftball: String
    var SFSoftball: String
    var SHSoftball: String
    var SBATTSoftball: String
    // pitching
    var ERASoftball: String
    var WHIPSoftball: String
    var WLSoftball: String
    var AppGSSoftball: String
    var CGSoftball: String
    var SHOSoftball: String
    var SVSoftball: String
    var IPSoftball: String
    var HSoftballp: String
    var RSoftballp: String
    var ERSoftball: String
    var BBSoftballp: String
    var SOSoftballp: String
    var doublesSoftballp: String
    var triplesSoftballp: String
    var HRSoftballp: String
    var ABSoftballp: String
    var BAVGSoftball: String
    var WPSoftball: String
    var HBPSoftballp: String
    var BKSoftball: String
    var SFASoftball: String
    var SHASoftball: String
    // fielding
    var CSoftball: String
    var POSoftball: String
    var ASoftball: String
    var ESoftball: String
    var FLDPercentageSoftball: String
    var DPSoftball: String
    var SBASoftball: String
    var CSBSoftball: String
    var PBSoftballc: String
    var CISoftballc: String
}


struct Softball: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var eventNameSoftball: String = ""
    @State private var locationSoftball: String = ""
    @State private var eventDateSoftball: String = ""
    @State private var resultInEventSoftball: String = ""
    // batting
    @State private var AVGSoftball: String = ""
    @State private var OPSSoftball: String = ""
    @State private var GPGSSoftball: String = ""
    @State private var ABSoftballb: String = ""
    @State private var RSoftballb: String = ""
    @State private var HSoftballb: String = ""
    @State private var doublesSoftballb: String = ""
    @State private var triplesSoftballb: String = ""
    @State private var HRSoftballb: String = ""
    @State private var RBISoftball: String = ""
    @State private var TBSoftball: String = ""
    @State private var SLGPercentageSoftball: String = ""
    @State private var BBSoftballb: String = ""
    @State private var HBPSoftballb: String = ""
    @State private var SOSoftballb: String = ""
    @State private var GDPSoftball: String = ""
    @State private var OBPercentageSoftball: String = ""
    @State private var SFSoftball: String = ""
    @State private var SHSoftball: String = ""
    @State private var SBATTSoftball: String = ""
    // pitching
    @State private var ERASoftball: String = ""
    @State private var WHIPSoftball: String = ""
    @State private var WLSoftball: String = ""
    @State private var AppGSSoftball: String = ""
    @State private var CGSoftball: String = ""
    @State private var SHOSoftball: String = ""
    @State private var SVSoftball: String = ""
    @State private var IPSoftball: String = ""
    @State private var HSoftballp: String = ""
    @State private var RSoftballp: String = ""
    @State private var ERSoftball: String = ""
    @State private var BBSoftballp: String = ""
    @State private var SOSoftballp: String = ""
    @State private var doublesSoftballp: String = ""
    @State private var triplesSoftballp: String = ""
    @State private var HRSoftballp: String = ""
    @State private var ABSoftballp: String = ""
    @State private var BAVGSoftball: String = ""
    @State private var WPSoftball: String = ""
    @State private var HBPSoftballp: String = ""
    @State private var BKSoftball: String = ""
    @State private var SFASoftball: String = ""
    @State private var SHASoftball: String = ""
    // fielding
    @State private var CSoftball: String = ""
    @State private var POSoftball: String = ""
    @State private var ASoftball: String = ""
    @State private var ESoftball: String = ""
    @State private var FLDPercentageSoftball: String = ""
    @State private var DPSoftball: String = ""
    @State private var SBASoftball: String = ""
    @State private var CSBSoftball: String = ""
    @State private var PBSoftballc: String = ""
    @State private var CISoftballc: String = ""
    
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Softball Statistics")
                    .frame(height: 100)
                    .foregroundColor(.blue)
                    .font(.title3)
                
                VStack {
                    TextField(
                        "Event Name",
                        text: $eventNameSoftball
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Location",
                        text: $locationSoftball
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Event Date(s)",
                        text: $eventDateSoftball
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Result in Event (if applicable)",
                        text: $resultInEventSoftball
                    )
                    .disableAutocorrection(true)
                    Text("Batting") // batting
                    TextField(
                        "Average (AVG)",
                        text: $AVGSoftball
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "On-base Plus Slugging (OPS)",
                        text: $OPSSoftball
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Games Played - Games Started (GP-GS)",
                        text: $GPGSSoftball
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "At-Bat (AB)",
                        text: $ABSoftballb
                    )
                    .disableAutocorrection(true)
                }
                VStack {
                    TextField(
                        "Runs (R)",
                        text: $RSoftballb
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Hits (H)",
                        text: $HSoftballb
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Doubles (2B)",
                        text: $doublesSoftballb
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Triples (3B)",
                        text: $triplesSoftballb
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Home Runs (HR)",
                        text: $HRSoftballb
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Runs Batted In (RBI)",
                        text: $RBISoftball
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Total Bases (TB)",
                        text: $TBSoftball
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Slugging Percentage (SLG%)",
                        text: $SLGPercentageSoftball
                    )
                    .disableAutocorrection(true)
                }
                VStack {
                    TextField(
                        "Walks (BB)",
                        text: $BBSoftballb
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Hit-By-Pitch (HBP)",
                        text: $HBPSoftballb
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Strikeouts (SO)",
                        text: $SOSoftballb
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Grounded into Double Plays (GDP)",
                        text: $GDPSoftball
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "On-Base Percentage (OB%)",
                        text: $OBPercentageSoftball
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Sacrifice Flies (SF)",
                        text: $SFSoftball
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Sacrifice Bunts (SH)",
                        text: $SHSoftball
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Stolen Bases - Attempts (SB-ATT)",
                        text: $SLGPercentageSoftball
                    )
                    .disableAutocorrection(true)
                }
                VStack {
                    Text("Pitching") // pitching
                    TextField(
                        "Earned Run Average (ERA)",
                        text: $ERASoftball
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Walks and Hits per Inning Pitched (WHIP)",
                        text: $WHIPSoftball
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Win Loss Record Pitching (W-L)",
                        text: $WLSoftball
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Appearances - Game Starts (App-GS) ",
                        text: $AppGSSoftball
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Complete Game (CG)",
                        text: $CGSoftball
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Shutouts (SHO)",
                        text: $SHOSoftball
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Saves (SV)",
                        text: $SVSoftball
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Innings Pitched (IP)",
                        text: $IPSoftball
                    )
                    .disableAutocorrection(true)
                }
                VStack {
                    TextField(
                        "Hits (H)",
                        text: $HSoftballp
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Runs (R)",
                        text: $RSoftballp
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Earned Runs (ER)",
                        text: $ERSoftball
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Walks (BB)",
                        text: $BBSoftballp
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Strikeouts (SO)",
                        text: $SOSoftballp
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Doubles (2B)",
                        text: $doublesSoftballp
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Triples (3B)",
                        text: $triplesSoftballp
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Home Runs (HR)",
                        text: $HRSoftballp
                    )
                    .disableAutocorrection(true)
                }
                VStack {
                    TextField(
                        "At-Bats (AB)",
                        text: $ABSoftballp
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Batting Average Against (B/AVG)",
                        text: $BAVGSoftball
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Wild Pitches (WP)",
                        text: $WPSoftball
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Hit-By-Pitch (HBP)",
                        text: $HBPSoftballp
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Balk (BK)",
                        text: $BKSoftball
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Sacrifice Flies Allowed (SFA)",
                        text: $SFASoftball
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Sacrificed Hits Allowed (SHA)",
                        text: $SHASoftball
                    )
                    .disableAutocorrection(true)
                }
                VStack {
                    Text("Fielding") // fielding
                    TextField(
                        "Chances (C)",
                        text: $CSoftball
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Putouts (PO)",
                        text: $POSoftball
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Assists (A)",
                        text: $ASoftball
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Errors (E)",
                        text: $ESoftball
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Fielding Percentage (FLD%)",
                        text: $FLDPercentageSoftball
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Double Plays Participated In (DP)",
                        text: $DPSoftball
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Stolen Bases Allowed (SBA)",
                        text: $SBASoftball
                    )
                    .disableAutocorrection(true)
                }
                VStack {
                    TextField(
                        "Caught Stealing By (CSB)",
                        text: $CSBSoftball
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Passed Balls (PB)",
                        text: $PBSoftballc
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Catchers Interference (CI)",
                        text: $CISoftballc
                    )
                    .disableAutocorrection(true)
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(.blue)
                            .frame(width: 200, height: 50)
                        /*NavigationLink(destination: FeedView(), isActive: $signInSuccess) { EmptyView()}
                         */
                        
                        Button {
                            let tempSoftballStat = softballStat(eventNameSoftball: eventNameSoftball, locationSoftball: locationSoftball, eventDateSoftball: eventDateSoftball, resultInEventSoftball: resultInEventSoftball, AVGSoftball: AVGSoftball, OPSSoftball: OPSSoftball, GPGSSoftball: GPGSSoftball, ABSoftballb: ABSoftballb, RSoftballb: RSoftballb, HSoftballb: HSoftballb, doublesSoftballb: doublesSoftballb, triplesSoftballb: triplesSoftballb, HRSoftballb: HRSoftballb, RBISoftball: RBISoftball, TBSoftball: TBSoftball, SLGPercentageSoftball: SLGPercentageSoftball, BBSoftballb: BBSoftballb, HBPSoftballb: HBPSoftballb, SOSoftballb: SOSoftballb, GDPSoftball: GDPSoftball, OBPercentageSoftball: OBPercentageSoftball, SFSoftball: SFSoftball, SHSoftball: SHSoftball, SBATTSoftball: SBATTSoftball, ERASoftball: ERASoftball, WHIPSoftball: WHIPSoftball, WLSoftball: WLSoftball, AppGSSoftball: AppGSSoftball, CGSoftball: CGSoftball, SHOSoftball: SHOSoftball, SVSoftball: SVSoftball, IPSoftball: IPSoftball, HSoftballp: HSoftballp, RSoftballp: RSoftballp, ERSoftball: ERSoftball, BBSoftballp: BBSoftballp, SOSoftballp: SOSoftballp, doublesSoftballp: doublesSoftballp, triplesSoftballp: triplesSoftballp, HRSoftballp: HRSoftballp, ABSoftballp: ABSoftballp, BAVGSoftball: BAVGSoftball, WPSoftball: WPSoftball, HBPSoftballp: HBPSoftballp, BKSoftball: BKSoftball, SFASoftball: SFASoftball, SHASoftball: SHASoftball, CSoftball: CSoftball, POSoftball: POSoftball, ASoftball: ASoftball, ESoftball: ESoftball, FLDPercentageSoftball: FLDPercentageSoftball, DPSoftball: DPSoftball, SBASoftball: SBASoftball, CSBSoftball: CSBSoftball, PBSoftballc: PBSoftballc, CISoftballc: CISoftballc )
                            createSoftballStat(newSoftballStat: tempSoftballStat)
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

func createSoftballStat(newSoftballStat: softballStat) {
    let handle = Auth.auth().addStateDidChangeListener { auth, user in
        if Auth.auth().currentUser != nil {
            let user = Auth.auth().currentUser
            if let user = user {
                let db = Firestore.firestore()
                db.collection("Stats").document("Softball").collection(user.uid).document().setData([
                    "eventNameSoftball" : newSoftballStat.eventNameSoftball,
                    "locationSoftball" : newSoftballStat.locationSoftball,
                    "eventDateSoftball" : newSoftballStat.eventDateSoftball,
                    "resultInEventSoftball" : newSoftballStat.resultInEventSoftball,
                    "AVGSoftball" : newSoftballStat.AVGSoftball,
                    "OPSsoftball" : newSoftballStat.OPSSoftball,
                    "GPGSSoftball" : newSoftballStat.GPGSSoftball,
                    "ABSoftballb" : newSoftballStat.ABSoftballb,
                    "RSoftballb" : newSoftballStat.RSoftballb,
                    "HSoftballb" : newSoftballStat.HSoftballb,
                    "doublesSoftballb" : newSoftballStat.doublesSoftballb,
                    "triplesSoftballb" : newSoftballStat.triplesSoftballb,
                    "HRSoftballb" : newSoftballStat.HRSoftballb,
                    "RBISoftball" : newSoftballStat.RBISoftball,
                    "TBSoftball" : newSoftballStat.TBSoftball,
                    "SLGPercentageSoftball" : newSoftballStat.SLGPercentageSoftball,
                    "BBSoftballb" : newSoftballStat.BBSoftballb,
                    "HBPSoftballb" : newSoftballStat.HBPSoftballb,
                    "SOSoftballb" : newSoftballStat.SOSoftballb,
                    "GDPSoftball" : newSoftballStat.GDPSoftball,
                    "OBPercentageSoftball" : newSoftballStat.OBPercentageSoftball,
                    "SFSoftball" : newSoftballStat.SFSoftball,
                    "SHSoftball" : newSoftballStat.SHSoftball,
                    "SBATTSoftball" : newSoftballStat.SBATTSoftball,
                    "ERASoftball" : newSoftballStat.ERASoftball,
                    "WHIPSoftball" : newSoftballStat.WHIPSoftball,
                    "WLSoftball" : newSoftballStat.WLSoftball,
                    "AppGSSoftball" : newSoftballStat.AppGSSoftball,
                    "CGSoftball" : newSoftballStat.CGSoftball,
                    "SHOSoftball" : newSoftballStat.SHOSoftball,
                    "SVSoftball" : newSoftballStat.SVSoftball,
                    "IPSoftball" : newSoftballStat.IPSoftball,
                    "HSoftballp" : newSoftballStat.HSoftballp,
                    "RSoftballp" : newSoftballStat.RSoftballp,
                    "ERSoftball" : newSoftballStat.ERASoftball,
                    "BBSoftballp" : newSoftballStat.BBSoftballp,
                    "SOSoftballp" : newSoftballStat.SOSoftballp,
                    "doublesSoftballp" : newSoftballStat.doublesSoftballp,
                    "triplesSoftballp" : newSoftballStat.triplesSoftballp,
                    "HRSoftballp" : newSoftballStat.HRSoftballp,
                    "BAVGSoftball" : newSoftballStat.BAVGSoftball,
                    "WPSoftball" : newSoftballStat.WPSoftball,
                    "HBPSoftballp" : newSoftballStat.HBPSoftballp,
                    "BKSoftball" : newSoftballStat.BKSoftball,
                    "SFASoftball" : newSoftballStat.SFASoftball,
                    "SHASoftball" : newSoftballStat.SHASoftball,
                    "CSoftball" : newSoftballStat.CSoftball,
                    "POSoftball" : newSoftballStat.POSoftball,
                    "ASoftball" : newSoftballStat.ASoftball,
                    "ESoftball" : newSoftballStat.ESoftball,
                    "FLDPercentageSoftball" : newSoftballStat.FLDPercentageSoftball,
                    "DPSoftball" : newSoftballStat.DPSoftball,
                    "SBASoftball" : newSoftballStat.SBASoftball,
                    "CSBSoftball" : newSoftballStat.CSBSoftball,
                    "PBSoftballc" : newSoftballStat.PBSoftballc,
                    "CISoftballc" : newSoftballStat.CISoftballc
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

struct Softball_Previews: PreviewProvider {
    static var previews: some View {
        Softball()
    }
}
