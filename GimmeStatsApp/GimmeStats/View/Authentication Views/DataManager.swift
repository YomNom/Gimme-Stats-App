//
//  DataManager.swift
//  GimmeStats
//
//  Created by Christina Duvall on 11/10/22.
//

import SwiftUI
import Firebase
import Combine

class DataManager: ObservableObject {
    let didChange = PassthroughSubject<DataManager, Never>()
    @Published var currentProfile: [Profile] = []
    @Published var userEvents: [Event] = []
    @Published var tennisStats: [tennisStat] = []
    @Published var baseballStats: [baseballStat] = []
    @Published var golfStats: [golfStat] = []
    @Published var laxStats: [laxStat] = []
    @Published var soccerStats: [soccerStat] = []
    @Published var softballStats: [softballStat] = []
    @Published var basketballStats: [basketballStat] = []
    @Published var numberOfEvents: Int = 0
    
    init() {
        fetchCurrentUser()
        fetchCalendar()
        fetchTennisStats()
        fetchLaxStats()
        fetchBasketballStats()
        fetchGolfStats()
        fetchSoccerStats()
        fetchSoftballStats()
        fetchBaseballStats()
    }
    
    func fetchCurrentUser() {
        let handle = Auth.auth().addStateDidChangeListener { [self] auth, user in
            if Auth.auth().currentUser != nil {
                let user = Auth.auth().currentUser
                if let user = user {
                    self.loadProfile(userID: user.uid)
                }
            } else { // DEBUG: User not logged in
                self.loadProfile(userID: "errorUserData")
            }
        }
        Auth.auth().removeStateDidChangeListener(handle)
    }
    
    func loadProfile(userID: String) {
        let userDb = Firestore.firestore()
        let ref = userDb.collection("Users").document(userID)
        ref.getDocument { document, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            if let document = document {
                let data = document.data()
                
                let id = document.documentID
                let firstName = data?["firstName"] as? String ?? ""
                let lastName = data?["lastName"] as? String ?? ""
                let userName = data?["userName"] as? String ?? ""
                let bio = data?["bio"] as? String ?? ""
                let currentYear = data?["currentYear"] as? String ?? ""
                let pronouns = data?["pronouns"] as? String ?? ""
                let GPA = data?["GPA"] as? String ?? ""
                let sport = data?["sport"] as? String ?? ""
                let position = data?["position"] as? String ?? ""
                let role = data?["accountType"] as? String ?? ""
                
                let profile = Profile(id: id, firstName: firstName, lastName: lastName, userName: userName, bio: bio, currentYear: currentYear, pronouns: pronouns, GPA: GPA, sport: sport, position: position, role: role)
                self.currentProfile = [profile]
                
            }
        }
    }
    
    func fetchCalendar() {
        let handle = Auth.auth().addStateDidChangeListener { auth, user in
            if Auth.auth().currentUser != nil {
                let user = Auth.auth().currentUser
                if let user = user {
                    let ref = Firestore.firestore().collection("Calendar").document(user.uid).collection("events")
                    self.userEvents.removeAll()
                    ref.getDocuments() { (querySnapshot, err) in
                        if let err = err {
                            print("Error getting documents: \(err)")
                        } else {
                            for document in querySnapshot!.documents {
                                let data = document.data()
                                //print("\(document.documentID) => \(data)")
                                
                                let name = data["eventName"] as? String ?? ""
                                let start = data["eventStart"] as? String ?? ""
                                let end = data["eventEnd"] as? String ?? ""
                                let loc = data["location"] as? String ?? ""
                                let notifSpec = data["notifySpectators"] as? String ?? ""
                                let participants = data["eventsParticipatedIn"] as? String ?? ""
                                
                                let event = Event(eventName: name, eventStart: start, eventEnd: end, location: loc, notifySpectators: notifSpec, eventsParticipatedIn: participants)
                                self.userEvents.append(event)
                            }
                        }
                    }
                }
            }
        }
        Auth.auth().removeStateDidChangeListener(handle)
    }
    
    func updateEvent() {
        
    }
    
    func deleteEvent() {
        
    }
    
    func fetchTennisStats() {
        let handle = Auth.auth().addStateDidChangeListener { auth, user in
            if Auth.auth().currentUser != nil {
                let user = Auth.auth().currentUser
                if let user = user {
                    let ref = Firestore.firestore().collection("Stats").document("Tennis").collection(user.uid)
                    self.tennisStats.removeAll()
                    ref.getDocuments() { (querySnapshot, err) in
                        if let err = err {
                            print("Error getting documents: \(err)")
                        } else {
                            for document in querySnapshot!.documents {
                                let data = document.data()
                                print("Tennis: \(document.documentID) => \(data)")
                                
                                let eventName = data["eventNameTennis"] as? String ?? ""
                                let location = data["locationTennis"] as? String ?? ""
                                let eventDate = data["eventDateTennis"] as? String ?? ""
                                let category = data["categoryTennis"] as? String ?? ""
                                let eventResults = data["resultInEventTennis"] as? String ?? ""
                                let aceAmount = data["aces"] as? String ?? ""
                                let dFaults = data["doubleFaults"] as? String ?? ""
                                let firstServe = data["firstServePercentage"] as? String ?? ""
                                let winPercentageOnFirstServe = data["winPercentageOnFirstServe"] as? String ?? ""
                                let secondServePercentage = data["secondServePercentage"] as? String ?? ""
                                let winPercentageOnSecondServe = data["winPercentageOnSecondServe"] as? String ?? ""
                                let breakPointRatio = data["breakPointRatio"] as? String ?? ""
                                let tiebreaksWon = data["tiebreaksWon"] as? String ?? ""
                                let recievingPointsWon = data["recievingPointsWon"] as? String ?? ""
                                let maxGamesWonInARow = data["maxGamesWonInARow"] as? String ?? ""
                                let serviceGamesWon = data["serviceGamesWon"] as? String ?? ""

                                
                                let tStat = tennisStat(eventNameTennis: eventName, locationTennis: location, eventDateTennis: eventDate, categoryTennis: category, resultInEventTennis: eventResults, aces: aceAmount, doubleFaults: dFaults, firstServePercentage: firstServe, winPercentageOnFirstServe: winPercentageOnFirstServe, secondServePercentage: secondServePercentage, winPercentageOnSecondServe: winPercentageOnSecondServe, breakPointRatio: breakPointRatio, tiebreaksWon: tiebreaksWon, recievingPointsWon: recievingPointsWon, maxGamesWonInARow: maxGamesWonInARow, serviceGamesWon: serviceGamesWon)
                                self.tennisStats.append(tStat)
                            }
                        }
                    }
                }
            }
        }
        Auth.auth().removeStateDidChangeListener(handle)
    }
    
    func fetchLaxStats() {
        let handle = Auth.auth().addStateDidChangeListener { auth, user in
            if Auth.auth().currentUser != nil {
                let user = Auth.auth().currentUser
                if let user = user {
                    let ref = Firestore.firestore().collection("Stats").document("Lacrosse").collection(user.uid)
                    self.laxStats.removeAll()
                    ref.getDocuments() { (querySnapshot, err) in
                        if let err = err {
                            print("Error getting documents: \(err)")
                        } else {
                            for document in querySnapshot!.documents {
                                let data = document.data()
                                print("Lacrosse: \(document.documentID) => \(data)")
                                
                                let eventName = data["eventNameLax"] as? String ?? ""
                                let location = data["locationLax"] as? String ?? ""
                                let eventDate = data["eventDateLax"] as? String ?? ""
                                let eventResults = data["resultInEventLax"] as? String ?? ""
                                let goals = data["goalsLax"] as? String ?? ""
                                let assists = data["assistsLax"] as? String ?? ""
                                let groundBalls = data["groundBalls"] as? String ?? ""
                                let shots = data["shotsLax"] as? String ?? ""
                                let turnovers = data["turnoversLax"] as? String ?? ""
                                let causedTurnovers = data["causedTurnoversLax"] as? String ?? ""

                                
                                let lStat = laxStat(eventNameLax: eventName, locationLax: location, eventDateLax: eventDate, resultInEventLax: eventResults, goalsLax: goals, assistsLax: assists, groundBalls: groundBalls, shotsLax: shots, turnoversLax: turnovers, causedTurnoversLax: causedTurnovers)
                                self.laxStats.append(lStat)
                            }
                        }
                    }
                }
            }
        }
        Auth.auth().removeStateDidChangeListener(handle)
    }
    
    func fetchBasketballStats() {
        let handle = Auth.auth().addStateDidChangeListener { auth, user in
            if Auth.auth().currentUser != nil {
                let user = Auth.auth().currentUser
                if let user = user {
                    let ref = Firestore.firestore().collection("Stats").document("Basketball").collection(user.uid)
                    self.basketballStats.removeAll()
                    ref.getDocuments() { (querySnapshot, err) in
                        if let err = err {
                            print("Error getting documents: \(err)")
                        } else {
                            for document in querySnapshot!.documents {
                                let data = document.data()
                                print("Basketball: \(document.documentID) => \(data)")
                                
                                let eventName = data["eventNameBB"] as? String ?? ""
                                let location = data["locationBB"] as? String ?? ""
                                let eventDate = data["eventDateBB"] as? String ?? ""
                                let eventResults = data["resultInEventBB"] as? String ?? ""
                                let totalPoints = data["totalPointsBB"] as? String ?? ""
                                let fieldGoals = data["fgMadeAttemptedBB"] as? String ?? ""
                                let fgPercentage = data["fgPercentageBB"] as? String ?? ""
                                let threePoints = data["tpMadeAttemptedBB"] as? String ?? ""
                                let tpPercentage = data["tpPercentageBB"] as? String ?? ""
                                let freeThrows = data["ftMadeAttemptedBB"] as? String ?? ""
                                let ftPercentage = data["ftPercentageBB"] as? String ?? ""
                                let rebounds = data["rebounds BB"] as? String ?? ""
                                let assists = data["assistsBB"] as? String ?? ""
                                let turnovers = data["turnoversBB"] as? String ?? ""
                                let pointsOffTurnovers = data["pointsOffTurnoversBB"] as? String ?? ""
                                let steals = data["stealsBB"] as? String ?? ""
                                let blocks = data["blocksBB"] as? String ?? ""

                                
                                let basketballStat = basketballStat(eventNameBB: eventName, locationBB: location, eventDateBB: eventDate, resultInEventBB: eventResults, totalPointsBB: totalPoints, fgMadeAttemptedBB: fieldGoals, fgPercentageBB: fgPercentage, tpMadeAttemptedBB: threePoints, tpPercentageBB: tpPercentage, ftMadeAttemptedBB: freeThrows, ftPercentageBB: ftPercentage, reboundsBB: rebounds, assistsBB: assists, turnoversBB: turnovers, pointsOffTurnoversBB: pointsOffTurnovers, stealsBB: steals, blocksBB: blocks )
                                self.basketballStats.append(basketballStat)
                            }
                        }
                    }
                }
            }
        }
        Auth.auth().removeStateDidChangeListener(handle)
    }
    
    func fetchGolfStats() {
        let handle = Auth.auth().addStateDidChangeListener { auth, user in
            if Auth.auth().currentUser != nil {
                let user = Auth.auth().currentUser
                if let user = user {
                    let ref = Firestore.firestore().collection("Stats").document("Golf").collection(user.uid)
                    self.golfStats.removeAll()
                    ref.getDocuments() { (querySnapshot, err) in
                        if let err = err {
                            print("Error getting documents: \(err)")
                        } else {
                            for document in querySnapshot!.documents {
                                let data = document.data()
                                print("Golf: \(document.documentID) => \(data)")
                                
                                let eventName = data["eventNameGolf"] as? String ?? ""
                                let location = data["locationGolf"] as? String ?? ""
                                let eventDate = data["eventDateGolf"] as? String ?? ""
                                let eventResults = data["resultInEventGolf"] as? String ?? ""
                                let lowRound = data["lowRound"] as? String ?? ""
                                let mostSubHoles = data["mostSubHoles"] as? String ?? ""
                                let firstRoundAvg = data["firstRoundAvg"] as? String ?? ""
                                let lastRoundAvg = data["lastRoundAvg"] as? String ?? ""
                                let par3Scoring = data["par3Scoring"] as? String ?? ""
                                let par4Scoring = data["par4Scoring"] as? String ?? ""
                                let par5Scoring = data["par5Scoring"] as? String ?? ""
                                let eagles = data["eagles"] as? String ?? ""
                                let birdies = data["birdies"] as? String ?? ""
                                let subparStrokesPerRound = data["subparStrokesPerRound"] as? String ?? ""
                                let parsPerRound = data["parsPerRound"] as? String ?? ""
                                let bogeysPerRound = data["bogeysPerRound"] as? String ?? ""
                                let dbBogeysPerRound = data["dbBogeysPerRound"] as? String ?? ""
                                let fairways = data["fairways"] as? String ?? ""
                                let greensInRegulation = data["greensInRegulation"] as? String ?? ""
                                let putts = data["putts"] as? String ?? ""
                                

                                
                                let golfStat = golfStat(eventNameGolf: eventName, locationGolf: location, eventDateGolf: eventDate, resultInEventGolf: eventResults, lowRound: lowRound, mostSubHoles: mostSubHoles, firstRoundAvg: firstRoundAvg, lastRoundAvg: lastRoundAvg, par3Scoring: par3Scoring, par4Scoring: par4Scoring, par5Scoring: par5Scoring, eagles: eagles, birdies: birdies, subparStrokesPerRound: subparStrokesPerRound, parsPerRound: parsPerRound, bogeysPerRound: bogeysPerRound, dbBogeysPerRound: dbBogeysPerRound, fairways: fairways, greensInRegulation: greensInRegulation, putts: putts )
                                self.golfStats.append(golfStat)
                            }
                        }
                    }
                }
            }
        }
        Auth.auth().removeStateDidChangeListener(handle)
    }
    
    func fetchSoccerStats() {
        let handle = Auth.auth().addStateDidChangeListener { auth, user in
            if Auth.auth().currentUser != nil {
                let user = Auth.auth().currentUser
                if let user = user {
                    let ref = Firestore.firestore().collection("Stats").document("Soccer").collection(user.uid)
                    self.soccerStats.removeAll()
                    ref.getDocuments() { (querySnapshot, err) in
                        if let err = err {
                            print("Error getting documents: \(err)")
                        } else {
                            for document in querySnapshot!.documents {
                                let data = document.data()
                                print("Soccer: \(document.documentID) => \(data)")
                                
                                let eventName = data["eventNameSoc"] as? String ?? ""
                                let location = data["locationSoc"] as? String ?? ""
                                let eventDate = data["eventDateSoc"] as? String ?? ""
                                let eventResults = data["resultInEventSoc"] as? String ?? ""
                                let goalsSoc = data["goalsSoc"] as? String ?? ""
                                let shotsTakenSoc = data["shotsTakenSoc"] as? String ?? ""
                                let shotsOnTargetSoc = data["shotsOnTargetSoc"] as? String ?? ""
                                let assistsSoc = data["assistsSoc"] as? String ?? ""
                                let passesSoc = data["passesSoc"] as? String ?? ""
                                let goalsAllowedSoc = data["goalsAllowedSoc"] as? String ?? ""
                                let goalsSavedSoc = data["goalsSavedSoc"] as? String ?? ""
                                let foulsSoc = data["foulsSoc"] as? String ?? ""
                                let penaltyKicksAllowedSoc = data["penaltyKicksAllowedSoc"] as? String ?? ""
                                let penaltyKicksSavedSoc = data["penaltyKicksSavedSoc"] as? String ?? ""
                                let freeKicksAllowedSoc = data["freeKicksAllowedsoc"] as? String ?? ""
                                let freeKicksSavedSoc = data["freeKicksSavedSoc"] as? String ?? ""
                                
                                let soccerStat = soccerStat(eventNameSoc: eventName, locationSoc: location, eventDateSoc: eventDate, resultInEventSoc: eventResults, goalsSoc: goalsSoc, shotsTakenSoc: shotsTakenSoc, shotsOnTargetSoc: shotsOnTargetSoc, assistsSoc: assistsSoc, passesSoc: passesSoc, goalsAllowedSoc: goalsAllowedSoc, goalsSavedSoc: goalsSavedSoc, foulsSoc: foulsSoc, penaltyKicksAllowedSoc: penaltyKicksAllowedSoc, penaltyKicksSavedSoc: penaltyKicksSavedSoc, freeKicksAllowedSoc: freeKicksAllowedSoc, freeKicksSavedSoc: freeKicksSavedSoc )
                                self.soccerStats.append(soccerStat)
                            }
                        }
                    }
                }
            }
        }
        Auth.auth().removeStateDidChangeListener(handle)
    }
    
    func fetchSoftballStats() {
        let handle = Auth.auth().addStateDidChangeListener { auth, user in
            if Auth.auth().currentUser != nil {
                let user = Auth.auth().currentUser
                if let user = user {
                    let ref = Firestore.firestore().collection("Stats").document("Softball").collection(user.uid)
                    self.softballStats.removeAll()
                    ref.getDocuments() { (querySnapshot, err) in
                        if let err = err {
                            print("Error getting documents: \(err)")
                        } else {
                            for document in querySnapshot!.documents {
                                let data = document.data()
                                print("Softball: \(document.documentID) => \(data)")
                                
                                let eventName = data["eventNameSoftball"] as? String ?? ""
                                let location = data["locationSoftball"] as? String ?? ""
                                let eventDate = data["eventDateSoftball"] as? String ?? ""
                                let eventResults = data["resultInEventSoftball"] as? String ?? ""
                                // batting
                                let AVGSoftball = data["AVGSoftball"] as? String ?? ""
                                let OPSSoftball = data["OPSSoftball"] as? String ?? ""
                                let GPGSSoftball = data["GPGSSoftball"] as? String ?? ""
                                let ABSoftballb = data["ABSoftballb"] as? String ?? ""
                                let RSoftballb = data["RSoftballb"] as? String ?? ""
                                let HSoftballb = data["HSoftballb"] as? String ?? ""
                                let doublesSoftballb = data["doublesSoftballb"] as? String ?? ""
                                let triplesSoftballb = data["triplesSoftballb"] as? String ?? ""
                                let HRSoftballb = data["HRSoftballb"] as? String ?? ""
                                let RBISoftball = data["RBISoftball"] as? String ?? ""
                                let TBSoftball = data["TBSoftball"] as? String ?? ""
                                let SLGPercentageSoftball = data["SLGPercentageSoftball"] as? String ?? ""
                                let BBSoftballb = data["BBSoftballb"] as? String ?? ""
                                let HBPSoftballb = data["HBPSoftballb"] as? String ?? ""
                                let SOSoftballb = data["SOSoftballb"] as? String ?? ""
                                let GDPSoftball = data["GDPSoftball"] as? String ?? ""
                                let OBPercentageSoftball = data["OBPercentageSoftball"] as? String ?? ""
                                let SFSoftball = data["SFSoftball"] as? String ?? ""
                                let SHSoftball = data["SHSoftball"] as? String ?? ""
                                let SBATTSoftball = data["SBATTSoftball"] as? String ?? ""
                               // pitching
                                let ERASoftball = data["ERASoftball"] as? String ?? ""
                                let WHIPSoftball = data["WHIPSoftball"] as? String ?? ""
                                let WLSoftball = data["WLSoftball"] as? String ?? ""
                                let AppGSSoftball = data["AppGSSoftball"] as? String ?? ""
                                let CGSoftball = data["CGSoftball"] as? String ?? ""
                                let SHOSoftball = data["SHOSoftball"] as? String ?? ""
                                let SVSoftball = data["SVSoftball"] as? String ?? ""
                                let IPSoftball = data["IPSoftball"] as? String ?? ""
                                let HSoftballp = data["HSoftballp"] as? String ?? ""
                                let RSoftballp = data["RSoftballp"] as? String ?? ""
                                let ERSoftball = data["ERSoftball"] as? String ?? ""
                                let BBSoftballp = data["BBSoftballp"] as? String ?? ""
                                let SOSoftballp = data["SOSoftballp"] as? String ?? ""
                                let doublesSoftballp = data["doublesSoftballp"] as? String ?? ""
                                let triplesSoftballp = data["triplesSoftballp"] as? String ?? ""
                                let HRSoftballp = data["HRSoftballp"] as? String ?? ""
                                let ABSoftballp = data["ABSoftballp"] as? String ?? ""
                                let BAVGSoftball = data["BAVGSoftball"] as? String ?? ""
                                let WPSoftball = data["WPSoftball"] as? String ?? ""
                                let HBPSoftballp = data["HBPSoftballp"] as? String ?? ""
                                let BKSoftball = data["BKSoftball"] as? String ?? ""
                                let SFASoftball = data["SFASoftball"] as? String ?? ""
                                let SHASoftball = data["SHASoftball"] as? String ?? ""
                                // fielding
                                let CSoftball = data["CSoftball"] as? String ?? ""
                                let POSoftball = data["POSoftball"] as? String ?? ""
                                let ASoftball = data["ASoftball"] as? String ?? ""
                                let ESoftball = data["ESoftball"] as? String ?? ""
                                let FLDPercentageSoftball = data["FLDPercentageSoftball"] as? String ?? ""
                                let DPSoftball = data["DPSoftball"] as? String ?? ""
                                let SBASoftball = data["SBASoftball"] as? String ?? ""
                                let CSBSoftball = data["CSBSoftball"] as? String ?? ""
                                let PBSoftballc = data["PBSoftballc"] as? String ?? ""
                                let CISoftballc = data["CISoftballc"] as? String ?? ""
                                
                                
                                
                                let softballStat = softballStat(eventNameSoftball: eventName, locationSoftball: location, eventDateSoftball: eventDate, resultInEventSoftball: eventResults, AVGSoftball: AVGSoftball, OPSSoftball: OPSSoftball, GPGSSoftball: GPGSSoftball, ABSoftballb: ABSoftballb, RSoftballb: RSoftballb, HSoftballb: HSoftballb, doublesSoftballb: doublesSoftballb, triplesSoftballb: triplesSoftballb, HRSoftballb: HRSoftballb, RBISoftball: RBISoftball, TBSoftball: TBSoftball, SLGPercentageSoftball: SLGPercentageSoftball, BBSoftballb: BBSoftballb, HBPSoftballb: HBPSoftballb, SOSoftballb: SOSoftballb, GDPSoftball: GDPSoftball, OBPercentageSoftball: OBPercentageSoftball, SFSoftball: SFSoftball, SHSoftball: SHSoftball, SBATTSoftball: SBATTSoftball, ERASoftball: ERASoftball, WHIPSoftball: WHIPSoftball, WLSoftball: WLSoftball, AppGSSoftball: AppGSSoftball, CGSoftball: CGSoftball, SHOSoftball: SHOSoftball, SVSoftball: SVSoftball, IPSoftball: IPSoftball, HSoftballp: HSoftballp, RSoftballp: RSoftballp, ERSoftball: ERSoftball, BBSoftballp: BBSoftballp, SOSoftballp: SOSoftballp, doublesSoftballp: doublesSoftballp, triplesSoftballp: triplesSoftballp, HRSoftballp: HRSoftballp, ABSoftballp: ABSoftballp, BAVGSoftball: BAVGSoftball, WPSoftball: WPSoftball, HBPSoftballp: HBPSoftballp, BKSoftball: BKSoftball, SFASoftball: SFASoftball, SHASoftball: SHASoftball, CSoftball: CSoftball, POSoftball: POSoftball, ASoftball: ASoftball, ESoftball: ESoftball, FLDPercentageSoftball: FLDPercentageSoftball, DPSoftball: DPSoftball, SBASoftball: SBASoftball, CSBSoftball: CSBSoftball, PBSoftballc: PBSoftballc, CISoftballc: CISoftballc )
                                self.softballStats.append(softballStat)
                            }
                        }
                    }
                }
            }
        }
        Auth.auth().removeStateDidChangeListener(handle)
    }
    
    func fetchBaseballStats() {
        let handle = Auth.auth().addStateDidChangeListener { auth, user in
            if Auth.auth().currentUser != nil {
                let user = Auth.auth().currentUser
                if let user = user {
                    let ref = Firestore.firestore().collection("Stats").document("Baseball").collection(user.uid)
                    self.baseballStats.removeAll()
                    ref.getDocuments() { (querySnapshot, err) in
                        if let err = err {
                            print("Error getting documents: \(err)")
                        } else {
                            for document in querySnapshot!.documents {
                                let data = document.data()
                                print("Baseball: \(document.documentID) => \(data)")
                                
                                let eventName = data["eventNameBaseB"] as? String ?? ""
                                let location = data["locationBaseB"] as? String ?? ""
                                let eventDate = data["eventDateBaseB"] as? String ?? ""
                                let eventResults = data["resultInEventBaseB"] as? String ?? ""
                                // batting
                                let AVGBaseB = data["AVGBaseB"] as? String ?? ""
                                let OPSBaseB = data["OPSBaseB"] as? String ?? ""
                                let GPGSBaseB = data["GPGSBaseB"] as? String ?? ""
                                let ABBaseBb = data["ABBaseBb"] as? String ?? ""
                                let RBaseBb = data["RBaseBb"] as? String ?? ""
                                let HBaseBb = data["HBaseBb"] as? String ?? ""
                                let doublesBaseBb = data["doublesBaseBb "] as? String ?? ""
                                let triplesBaseBb = data["triplesBaseBb"] as? String ?? ""
                                let HRBaseBb = data["HRBaseBb"] as? String ?? ""
                                let RBIBaseB = data["RBIBaseB"] as? String ?? ""
                                let TBBaseB = data["TBBaseB"] as? String ?? ""
                                let SLGPercentageBaseB = data["SLGPercentageBaseB"] as? String ?? ""
                                let BBBaseBb = data["BBBaseBb"] as? String ?? ""
                                let HBPBaseBb = data["HBPBaseBb"] as? String ?? ""
                                let SOBaseBb = data["SOBaseBb"] as? String ?? ""
                                let GDPBaseB = data["GDPBaseB"] as? String ?? ""
                                let OBPercentageBaseB = data["OBPercentageBaseB"] as? String ?? ""
                                let SFBaseB = data["SFBaseB"] as? String ?? ""
                                let SHBaseB = data["SHBaseB"] as? String ?? ""
                                let SBATTBaseB = data["SBATTBaseB"] as? String ?? ""
                               // pitching
                                let ERABaseB = data["ERABaseB"] as? String ?? ""
                                let WHIPBaseB = data["WHIPBaseB"] as? String ?? ""
                                let WLBaseB = data["WLBaseB"] as? String ?? ""
                                let AppGSBaseB = data["AppGSBaseB"] as? String ?? ""
                                let CGBaseB = data["CGCGBaseB"] as? String ?? ""
                                let SHOBaseB = data["SHOBaseB"] as? String ?? ""
                                let SVBaseB = data["SVBaseB"] as? String ?? ""
                                let IPBaseB = data["IPBaseB"] as? String ?? ""
                                let HBaseBp = data["HBaseBp"] as? String ?? ""
                                let RBaseBp = data["RBaseBp"] as? String ?? ""
                                let ERBaseB = data["ERBaseB"] as? String ?? ""
                                let BBBaseBp = data["BBBaseBp"] as? String ?? ""
                                let SOBaseBp = data["SOBaseBp"] as? String ?? ""
                                let doublesBaseBp = data["doublesBaseBp"] as? String ?? ""
                                let triplesBaseBp = data["triplesBaseBp"] as? String ?? ""
                                let HRBaseBp = data["HRBaseBp"] as? String ?? ""
                                let ABBaseBp = data["ABBaseBp"] as? String ?? ""
                                let BAVGBaseB = data["BAVGBaseB"] as? String ?? ""
                                let WPBaseB = data["WPBaseB"] as? String ?? ""
                                let HBPBaseBp = data["HBPBaseBp"] as? String ?? ""
                                let BKBaseB = data["BKBaseB"] as? String ?? ""
                                let SFABaseB = data["SFABaseB"] as? String ?? ""
                                let SHABaseB = data["SHABaseB"] as? String ?? ""
                                // fielding
                                let CBaseB = data["CBaseB"] as? String ?? ""
                                let POBaseB = data["POBaseB"] as? String ?? ""
                                let ABaseB = data["ABaseB"] as? String ?? ""
                                let EBaseB = data["EBaseB"] as? String ?? ""
                                let FLDPercentageBaseB = data["FLDPercentageBaseB"] as? String ?? ""
                                let DPBaseB = data["DPBaseB"] as? String ?? ""
                                let SBABaseB = data["SBASBABaseB"] as? String ?? ""
                                let CSBBaseB = data["CSBBaseB"] as? String ?? ""
                                let PBBaseBc = data["PBBaseBc"] as? String ?? ""
                                let CIBaseBc = data["CIBaseBc"] as? String ?? ""
                                
                                
                                
                                let baseballStat = baseballStat(eventNameBaseB: eventName, locationBaseB: location, eventDateBaseB: eventDate, resultInEventBaseB: eventResults, AVGBaseB: AVGBaseB, OPSBaseB: OPSBaseB, GPGSBaseB: GPGSBaseB, ABBaseBb: ABBaseBb, RBaseBb: RBaseBb, HBaseBb: HBaseBb, doublesBaseBb: doublesBaseBb, triplesBaseBb: triplesBaseBb, HRBaseBb: HRBaseBb, RBIBaseB: RBIBaseB, TBBaseB: TBBaseB, SLGPercentageBaseB: SLGPercentageBaseB, BBBaseBb: BBBaseBb, HBPBaseBb: HBPBaseBb, SOBaseBb: SOBaseBb, GDPBaseB: GDPBaseB, OBPercentageBaseB: OBPercentageBaseB, SFBaseB: SFBaseB, SHBaseB: SHBaseB, SBATTBaseB: SBATTBaseB, ERABaseB: ERABaseB, WHIPBaseB: WHIPBaseB, WLBaseB: WLBaseB, AppGSBaseB: AppGSBaseB, CGBaseB: CGBaseB, SHOBaseB: SHOBaseB, SVBaseB: SVBaseB, IPBaseB: IPBaseB, HBaseBp: HBaseBp, RBaseBp: RBaseBp, ERBaseB: ERBaseB, BBBaseBp: BBBaseBp, SOBaseBp: SOBaseBp, doublesBaseBp: doublesBaseBp, triplesBaseBp: triplesBaseBp, HRBaseBp: HRBaseBp, ABBaseBp: ABBaseBp, BAVGBaseB: BAVGBaseB, WPBaseB: WPBaseB, HBPBaseBp: HBPBaseBp, BKBaseB: BKBaseB, SFABaseB: SFABaseB, SHABaseB: SHABaseB, CBaseB: CBaseB, POBaseB: POBaseB, ABaseB: ABaseB, EBaseB: EBaseB, FLDPercentageBaseB: FLDPercentageBaseB, DPBaseB: DPBaseB, SBABaseB: SBABaseB, CSBBaseB: CSBBaseB, PBBaseBc: PBBaseBc, CIBaseBc: CIBaseBc )
                                self.baseballStats.append(baseballStat)
                            }
                        }
                    }
                }
            }
        }
        Auth.auth().removeStateDidChangeListener(handle)
    }
}

