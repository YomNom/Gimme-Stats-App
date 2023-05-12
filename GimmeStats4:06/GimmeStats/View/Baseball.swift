//
//  Baseball.swift
//  GimmeStats
//
//  Created by Christina Duvall on 4/18/23.
//

import SwiftUI
import Firebase

struct baseballStat: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var eventNameBaseB: String
    var locationBaseB: String
    var eventDateBaseB: String
    var resultInEventBaseB: String
    // batting
    var AVGBaseB: String
    var OPSBaseB: String
    var GPGSBaseB: String
    var ABBaseBb: String
    var RBaseBb: String
    var HBaseBb: String
    var doublesBaseBb: String
    var triplesBaseBb: String
    var HRBaseBb: String
    var RBIBaseB: String
    var TBBaseB: String
    var SLGPercentageBaseB: String
    var BBBaseBb: String //walks baseball batting
    var HBPBaseBb: String
    var SOBaseBb: String
    var GDPBaseB: String
    var OBPercentageBaseB: String
    var SFBaseB: String
    var SHBaseB: String
    var SBATTBaseB: String
    // pitching
    var ERABaseB: String
    var WHIPBaseB: String
    var WLBaseB: String
    var AppGSBaseB: String
    var CGBaseB: String
    var SHOBaseB: String
    var SVBaseB: String
    var IPBaseB: String
    var HBaseBp: String
    var RBaseBp: String
    var ERBaseB: String
    var BBBaseBp: String
    var SOBaseBp: String
    var doublesBaseBp: String
    var triplesBaseBp: String
    var HRBaseBp: String
    var ABBaseBp: String
    var BAVGBaseB: String
    var WPBaseB: String
    var HBPBaseBp: String
    var BKBaseB: String
    var SFABaseB: String
    var SHABaseB: String
    // fielding
    var CBaseB: String
    var POBaseB: String
    var ABaseB: String
    var EBaseB: String
    var FLDPercentageBaseB: String
    var DPBaseB: String
    var SBABaseB: String
    var CSBBaseB: String
    var PBBaseBc: String
    var CIBaseBc: String
}


struct Baseball: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var eventNameBaseB: String = ""
    @State private var locationBaseB: String = ""
    @State private var eventDateBaseB: String = ""
    @State private var resultInEventBaseB: String = ""
    // batting
    @State private var AVGBaseB: String = ""
    @State private var OPSBaseB: String = ""
    @State private var GPGSBaseB: String = ""
    @State private var ABBaseBb: String = ""
    @State private var RBaseBb: String = ""
    @State private var HBaseBb: String = ""
    @State private var doublesBaseBb: String = ""
    @State private var triplesBaseBb: String = ""
    @State private var HRBaseBb: String = ""
    @State private var RBIBaseB: String = ""
    @State private var TBBaseB: String = ""
    @State private var SLGPercentageBaseB: String = ""
    @State private var BBBaseBb: String = ""
    @State private var HBPBaseBb: String = ""
    @State private var SOBaseBb: String = ""
    @State private var GDPBaseB: String = ""
    @State private var OBPercentageBaseB: String = ""
    @State private var SFBaseB: String = ""
    @State private var SHBaseB: String = ""
    @State private var SBATTBaseB: String = ""
    // pitching
    @State private var ERABaseB: String = ""
    @State private var WHIPBaseB: String = ""
    @State private var WLBaseB: String = ""
    @State private var AppGSBaseB: String = ""
    @State private var CGBaseB: String = ""
    @State private var SHOBaseB: String = ""
    @State private var SVBaseB: String = ""
    @State private var IPBaseB: String = ""
    @State private var HBaseBp: String = ""
    @State private var RBaseBp: String = ""
    @State private var ERBaseB: String = ""
    @State private var BBBaseBp: String = ""
    @State private var SOBaseBp: String = ""
    @State private var doublesBaseBp: String = ""
    @State private var triplesBaseBp: String = ""
    @State private var HRBaseBp: String = ""
    @State private var ABBaseBp: String = ""
    @State private var BAVGBaseB: String = ""
    @State private var WPBaseB: String = ""
    @State private var HBPBaseBp: String = ""
    @State private var BKBaseB: String = ""
    @State private var SFABaseB: String = ""
    @State private var SHABaseB: String = ""
    // fielding
    @State private var CBaseB: String = ""
    @State private var POBaseB: String = ""
    @State private var ABaseB: String = ""
    @State private var EBaseB: String = ""
    @State private var FLDPercentageBaseB: String = ""
    @State private var DPBaseB: String = ""
    @State private var SBABaseB: String = ""
    @State private var CSBBaseB: String = ""
    @State private var PBBaseBc: String = ""
    @State private var CIBaseBc: String = ""
    
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Baseball Statistics")
                    .frame(height: 100)
                    .foregroundColor(.blue)
                    .font(.title3)
                
                VStack {
                    TextField(
                        "Event Name",
                        text: $eventNameBaseB
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Location",
                        text: $locationBaseB
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Event Date(s)",
                        text: $eventDateBaseB
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Result in Event (if applicable)",
                        text: $resultInEventBaseB
                    )
                    .disableAutocorrection(true)
                    Text("Batting") // batting
                    TextField(
                        "Average (AVG)",
                        text: $AVGBaseB
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "On-base Plus Slugging (OPS)",
                        text: $OPSBaseB
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Games Played - Games Started (GP-GS)",
                        text: $GPGSBaseB
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "At-Bat (AB)",
                        text: $ABBaseBb
                    )
                    .disableAutocorrection(true)
                }
                VStack {
                    TextField(
                        "Runs (R)",
                        text: $RBaseBb
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Hits (H)",
                        text: $HBaseBb
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Doubles (2B)",
                        text: $doublesBaseBb
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Triples (3B)",
                        text: $triplesBaseBb
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Home Runs (HR)",
                        text: $HRBaseBb
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Runs Batted In (RBI)",
                        text: $RBIBaseB
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Total Bases (TB)",
                        text: $TBBaseB
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Slugging Percentage (SLG%)",
                        text: $SLGPercentageBaseB
                    )
                    .disableAutocorrection(true)
                }
                VStack {
                    TextField(
                        "Walks (BB)",
                        text: $BBBaseBb
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Hit-By-Pitch (HBP)",
                        text: $HBPBaseBb
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Strikeouts (SO)",
                        text: $SOBaseBb
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Grounded into Double Plays (GDP)",
                        text: $GDPBaseB
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "On-Base Percentage (OB%)",
                        text: $OBPercentageBaseB
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Sacrifice Flies (SF)",
                        text: $SFBaseB
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Sacrifice Bunts (SH)",
                        text: $SHBaseB
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Stolen Bases - Attempts (SB-ATT)",
                        text: $SLGPercentageBaseB
                    )
                    .disableAutocorrection(true)
                }
                VStack {
                    Text("Pitching") // pitching
                    TextField(
                        "Earned Run Average (ERA)",
                        text: $ERABaseB
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Walks and Hits per Inning Pitched (WHIP)",
                        text: $WHIPBaseB
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Win Loss Record Pitching (W-L)",
                        text: $WLBaseB
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Appearances - Game Starts (App-GS) ",
                        text: $AppGSBaseB
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Complete Game (CG)",
                        text: $CGBaseB
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Shutouts (SHO)",
                        text: $SHOBaseB
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Saves (SV)",
                        text: $SVBaseB
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Innings Pitched (IP)",
                        text: $IPBaseB
                    )
                    .disableAutocorrection(true)
                }
                VStack {
                    TextField(
                        "Hits (H)",
                        text: $HBaseBp
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Runs (R)",
                        text: $RBaseBp
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Earned Runs (ER)",
                        text: $ERBaseB
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Walks (BB)",
                        text: $BBBaseBp
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Strikeouts (SO)",
                        text: $SOBaseBp
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Doubles (2B)",
                        text: $doublesBaseBp
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Triples (3B)",
                        text: $triplesBaseBp
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Home Runs (HR)",
                        text: $HRBaseBp
                    )
                    .disableAutocorrection(true)
                }
                VStack {
                    TextField(
                        "At-Bats (AB)",
                        text: $ABBaseBp
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Batting Average Against (B/AVG)",
                        text: $BAVGBaseB
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Wild Pitches (WP)",
                        text: $WPBaseB
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Hit-By-Pitch (HBP)",
                        text: $HBPBaseBp
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Balk (BK)",
                        text: $BKBaseB
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Sacrifice Flies Allowed (SFA)",
                        text: $SFABaseB
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Sacrificed Hits Allowed (SHA)",
                        text: $SHABaseB
                    )
                    .disableAutocorrection(true)
                }
                VStack {
                    Text("Fielding") // fielding
                    TextField(
                        "Chances (C)",
                        text: $CBaseB
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Putouts (PO)",
                        text: $POBaseB
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Assists (A)",
                        text: $ABaseB
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Errors (E)",
                        text: $EBaseB
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Fielding Percentage (FLD%)",
                        text: $FLDPercentageBaseB
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Double Plays Participated In (DP)",
                        text: $DPBaseB
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Stolen Bases Allowed (SBA)",
                        text: $SBABaseB
                    )
                    .disableAutocorrection(true)
                }
                VStack {
                    TextField(
                        "Caught Stealing By (CSB)",
                        text: $CSBBaseB
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Passed Balls (PB)",
                        text: $PBBaseBc
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Catchers Interference (CI)",
                        text: $CIBaseBc
                    )
                    .disableAutocorrection(true)
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(.blue)
                            .frame(width: 200, height: 50)
                        /*NavigationLink(destination: FeedView(), isActive: $signInSuccess) { EmptyView()}
                         */
                        
                        Button {
                            let tempBaseballStat = baseballStat(eventNameBaseB: eventNameBaseB, locationBaseB: locationBaseB, eventDateBaseB: eventDateBaseB, resultInEventBaseB: resultInEventBaseB, AVGBaseB: AVGBaseB, OPSBaseB: OPSBaseB, GPGSBaseB: GPGSBaseB, ABBaseBb: ABBaseBb, RBaseBb: RBaseBb, HBaseBb: HBaseBb, doublesBaseBb: doublesBaseBb, triplesBaseBb: triplesBaseBb, HRBaseBb: HRBaseBb, RBIBaseB: RBIBaseB, TBBaseB: TBBaseB, SLGPercentageBaseB: SLGPercentageBaseB, BBBaseBb: BBBaseBb, HBPBaseBb: HBPBaseBb, SOBaseBb: SOBaseBb, GDPBaseB: GDPBaseB, OBPercentageBaseB: OBPercentageBaseB, SFBaseB: SFBaseB, SHBaseB: SHBaseB, SBATTBaseB: SBATTBaseB, ERABaseB: ERABaseB, WHIPBaseB: WHIPBaseB, WLBaseB: WLBaseB, AppGSBaseB: AppGSBaseB, CGBaseB: CGBaseB, SHOBaseB: SHOBaseB, SVBaseB: SVBaseB, IPBaseB: IPBaseB, HBaseBp: HBaseBp, RBaseBp: RBaseBp, ERBaseB: ERBaseB, BBBaseBp: BBBaseBp, SOBaseBp: SOBaseBp, doublesBaseBp: doublesBaseBp, triplesBaseBp: triplesBaseBp, HRBaseBp: HRBaseBp, ABBaseBp: ABBaseBp, BAVGBaseB: BAVGBaseB, WPBaseB: WPBaseB, HBPBaseBp: HBPBaseBp, BKBaseB: BKBaseB, SFABaseB: SFABaseB, SHABaseB: SHABaseB, CBaseB: CBaseB, POBaseB: POBaseB, ABaseB: ABaseB, EBaseB: EBaseB, FLDPercentageBaseB: FLDPercentageBaseB, DPBaseB: DPBaseB, SBABaseB: SBABaseB, CSBBaseB: CSBBaseB, PBBaseBc: PBBaseBc, CIBaseBc: CIBaseBc )
                            createBaseballStat(newBaseballStat: tempBaseballStat)
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

func createBaseballStat(newBaseballStat: baseballStat) {
    let handle = Auth.auth().addStateDidChangeListener { auth, user in
        if Auth.auth().currentUser != nil {
            let user = Auth.auth().currentUser
            if let user = user {
                let db = Firestore.firestore()
                db.collection("Stats").document("Baseball").collection(user.uid).document().setData([
                    "eventNameBaseB" : newBaseballStat.eventNameBaseB,
                    "locationBaseB" : newBaseballStat.locationBaseB,
                    "eventDateBaseB" : newBaseballStat.eventDateBaseB,
                    "resultInEventBaseB" : newBaseballStat.resultInEventBaseB,
                    "AVGBaseB" : newBaseballStat.AVGBaseB,
                    "OPSBaseB" : newBaseballStat.OPSBaseB,
                    "GPGSBaseB" : newBaseballStat.GPGSBaseB,
                    "ABBaseBb" : newBaseballStat.ABBaseBb,
                    "RBaseBb" : newBaseballStat.RBaseBb,
                    "HBaseBb" : newBaseballStat.HBaseBb,
                    "doublesBaseBb" : newBaseballStat.doublesBaseBb,
                    "triplesBaseBb" : newBaseballStat.triplesBaseBb,
                    "HRBaseBb" : newBaseballStat.HRBaseBb,
                    "RBIBaseB" : newBaseballStat.RBIBaseB,
                    "TBBaseB" : newBaseballStat.TBBaseB,
                    "SLGPercentageBaseB" : newBaseballStat.SLGPercentageBaseB,
                    "BBBaseBb" : newBaseballStat.BBBaseBb,
                    "HBPBaseBb" : newBaseballStat.HBPBaseBb,
                    "SOBaseBb" : newBaseballStat.SOBaseBb,
                    "GDPBaseB" : newBaseballStat.GDPBaseB,
                    "OBPercentageBaseB" : newBaseballStat.OBPercentageBaseB,
                    "SFBaseB" : newBaseballStat.SFBaseB,
                    "SHBaseB" : newBaseballStat.SHBaseB,
                    "SBATTBaseB" : newBaseballStat.SBATTBaseB,
                    "ERABaseB" : newBaseballStat.ERABaseB,
                    "WHIPBaseB" : newBaseballStat.WHIPBaseB,
                    "WLBaseB" : newBaseballStat.WLBaseB,
                    "AppGSBaseB" : newBaseballStat.AppGSBaseB,
                    "CGBaseB" : newBaseballStat.CGBaseB,
                    "SHOBaseB" : newBaseballStat.SHOBaseB,
                    "SVBaseB" : newBaseballStat.SVBaseB,
                    "IPBaseB" : newBaseballStat.IPBaseB,
                    "HBaseBp" : newBaseballStat.HBaseBp,
                    "RBaseBp" : newBaseballStat.RBaseBp,
                    "ERBaseB" : newBaseballStat.ERABaseB,
                    "BBBaseBp" : newBaseballStat.BBBaseBp,
                    "SOBaseBp" : newBaseballStat.SOBaseBp,
                    "doublesBaseBp" : newBaseballStat.doublesBaseBp,
                    "triplesBaseBp" : newBaseballStat.triplesBaseBp,
                    "HRBaseBp" : newBaseballStat.HRBaseBp,
                    "BAVGBaseB" : newBaseballStat.BAVGBaseB,
                    "WPBaseB" : newBaseballStat.WPBaseB,
                    "HBPBaseBp" : newBaseballStat.HBPBaseBp,
                    "BKBaseB" : newBaseballStat.BKBaseB,
                    "SFABaseB" : newBaseballStat.SFABaseB,
                    "SHABaseB" : newBaseballStat.SHABaseB,
                    "CBaseB" : newBaseballStat.CBaseB,
                    "POBaseB" : newBaseballStat.POBaseB,
                    "ABaseB" : newBaseballStat.ABaseB,
                    "EBaseB" : newBaseballStat.EBaseB,
                    "FLDPercentageBaseB" : newBaseballStat.FLDPercentageBaseB,
                    "DPBaseB" : newBaseballStat.DPBaseB,
                    "SBABaseB" : newBaseballStat.SBABaseB,
                    "CSBBaseB" : newBaseballStat.CSBBaseB,
                    "PBBaseBc" : newBaseballStat.PBBaseBc,
                    "CIBaseBc" : newBaseballStat.CIBaseBc
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

struct Baseball_Previews: PreviewProvider {
    static var previews: some View {
        Baseball()
    }
}
