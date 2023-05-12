//
//  Home.swift
//  GimmeStats
//
//  Created by Joey Yong and Christina Duvall on 11/17/22.
//

import SwiftUI
import Firebase

struct Home: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var addStats = false
    
    var body: some View {
        NavigationView {
    
                ZStack {
                    Text("")
                        .navigationTitle("Stats Feed")
                        .navigationBarItems(trailing:
                                                Button(action:  {
                            self.addStats.toggle()
                        }, label: {
                            Image(systemName: "plus")
                        }))
                        .sheet(isPresented: $addStats) {
                            SportsTemplateView()
                        }
                    VStack {
                        List() {
                            ForEach(dataManager.tennisStats, id: \.self) { stat in
                                Section(header: Text(stat.eventNameTennis) + Text(Image(systemName: "tennis.racket"))
                                    .font(.title2)
                                    .foregroundColor(.pink)) {
                                        Group {
                                            Text("Date: \(stat.eventDateTennis)")
                                            Text("Location: \(stat.locationTennis)")
                                            Text("Category: \(stat.categoryTennis)")
                                            Text("Results: \(stat.resultInEventTennis)")
                                            Text("Aces: \(stat.aces)")
                                            Text("Double Faults: \(stat.doubleFaults)")
                                            Text("First Serve %: \(stat.firstServePercentage)")
                                            Text("Win % on First Serve: \(stat.winPercentageOnFirstServe)")
                                            Text("Second Serve %: \(stat.secondServePercentage)")
                                            Text("Win % on Second Serve: \(stat.winPercentageOnSecondServe)")
                                        }
                                        Group {
                                            Text("Break Point Ratio: \(stat.breakPointRatio)")
                                            Text("Tiebreaks Won: \(stat.tiebreaksWon)")
                                            Text("Recieving Points Won: \(stat.recievingPointsWon)")
                                            Text("Max. Games Won in a Row: \(stat.maxGamesWonInARow)")
                                            Text("Service Games Won: \(stat.maxGamesWonInARow)")
                                        }
                                    }
                            }
                            
                            ForEach(dataManager.laxStats, id: \.self) { stat in
                                Section(header: Text(stat.eventNameLax) + Text(Image(systemName: "figure.lacrosse"))
                                    .font(.title2)
                                    .foregroundColor(.blue)) {
                                        Group {
                                            Text("Date: \(stat.eventDateLax)")
                                            Text("Location: \(stat.locationLax)")
                                            Text("Results: \(stat.resultInEventLax)")
                                            Text("Goals: \(stat.goalsLax)")
                                            Text("Assists: \(stat.assistsLax)")
                                            Text("Ground Balls: \(stat.groundBalls)")
                                            Text("Shots: \(stat.shotsLax)")
                                            Text("Turnovers: \(stat.turnoversLax)")
                                            Text("Caused Turnovers: \(stat.causedTurnoversLax)")
                                        }
                                    }
                            }
                            
                            ForEach(dataManager.basketballStats, id: \.self) { stat in
                                Section(header: Text(stat.eventNameBB) + Text(Image(systemName: "basketball.fill"))
                                    .font(.title2)
                                    .foregroundColor(.orange)) {
                                        Group {
                                            Text("Date: \(stat.eventDateBB)")
                                            Text("Location: \(stat.locationBB)")
                                            Text("Results: \(stat.resultInEventBB)")
                                            Text("Total Points: \(stat.totalPointsBB)")
                                            Text("Field Goals: \(stat.fgMadeAttemptedBB)")
                                            Text("Field Goal %: \(stat.fgPercentageBB)")
                                            Text("Three Points: \(stat.tpMadeAttemptedBB)")
                                            Text("Three Point %: \(stat.tpPercentageBB)")
                                            Text("Free Throws: \(stat.ftMadeAttemptedBB)")
                                        }
                                        Group {
                                            Text("Free Throw %: \(stat.ftPercentageBB)")
                                            Text("Rebounds: \(stat.reboundsBB)")
                                            Text("Assists: \(stat.assistsBB)")
                                            Text("Turnovers: \(stat.turnoversBB)")
                                            Text("Points Made Off of Turnovers: \(stat.pointsOffTurnoversBB)")
                                            Text("Steals: \(stat.stealsBB)")
                                            Text("Blocks: \(stat.blocksBB)")
                                        }
                                    }
                            }
                            
                            ForEach(dataManager.golfStats, id: \.self) { stat in
                                Section(header: Text(stat.eventNameGolf) + Text(Image(systemName: "figure.golf"))
                                    .font(.title2)
                                    .foregroundColor(.green)) {
                                        Group {
                                            Text("Date: \(stat.eventDateGolf)")
                                            Text("Location: \(stat.locationGolf)")
                                            Text("Results: \(stat.resultInEventGolf)")
                                            Text("Low Round: \(stat.lowRound)")
                                            Text("Most Sub Holes: \(stat.mostSubHoles)")
                                            Text("First Round Average: \(stat.firstRoundAvg)")
                                            Text("Last Round Average: \(stat.lastRoundAvg)")
                                            Text("Par 3 Scoring: \(stat.par3Scoring)")
                                            Text("Par 4 Scoring: \(stat.par4Scoring)")
                                        }
                                        Group {
                                            Text("Par 5 Scoring: \(stat.par5Scoring)")
                                            Text("Eagles: \(stat.eagles)")
                                            Text("Birdies: \(stat.birdies)")
                                            Text("Subpar Strokes per Round: \(stat.subparStrokesPerRound)")
                                            Text("Pars per Round: \(stat.parsPerRound)")
                                            Text("Bogeys per Round: \(stat.bogeysPerRound)")
                                            Text("Double Bogeys per Round: \(stat.dbBogeysPerRound)")
                                            Text("Fairways: \(stat.fairways)")
                                            Text("Greens in Regulation: \(stat.greensInRegulation)")
                                            Text("Putts: \(stat.putts)")
                                        }
                                    }
                            }
                            
                            ForEach(dataManager.soccerStats, id: \.self) { stat in
                                Section(header: Text(stat.eventNameSoc) + Text(Image(systemName: "soccerball"))
                                    .font(.title2)
                                    .foregroundColor(.purple)) {
                                        Group {
                                            Text("Date: \(stat.eventDateSoc)")
                                            Text("Location: \(stat.locationSoc)")
                                            Text("Results: \(stat.resultInEventSoc)")
                                            Text("Goals: \(stat.goalsSoc)")
                                            Text("Shots Taken: \(stat.shotsTakenSoc)")
                                            Text("Shots on Target: \(stat.shotsOnTargetSoc)")
                                            Text("Assists: \(stat.assistsSoc)")
                                            Text("Passes: \(stat.passesSoc)")
                                            Text("Goals Allowed: \(stat.goalsAllowedSoc)")
                                        }
                                        Group {
                                            Text("Goals Saved: \(stat.goalsSavedSoc)")
                                            Text("Fouls: \(stat.foulsSoc)")
                                            Text("Penalty Kicks Allowed: \(stat.penaltyKicksAllowedSoc)")
                                            Text("Penalty Kicks Saved: \(stat.penaltyKicksSavedSoc)")
                                            Text("Free Kicks Allowed: \(stat.freeKicksAllowedSoc)")
                                            Text("Free Kicks Saved: \(stat.freeKicksSavedSoc)")
                                        }
                                    }
                            }
                            
                            ForEach(dataManager.softballStats, id: \.self) { stat in
                                Section(header: Text(stat.eventNameSoftball) + Text(Image(systemName: "figure.softball"))
                                    .font(.title2)
                                    .foregroundColor(.yellow)) {
                                        Group {
                                            Text("Batting")
                                            Text("Date: \(stat.eventDateSoftball)")
                                            Text("Location: \(stat.locationSoftball)")
                                            Text("Results: \(stat.resultInEventSoftball)")
                                            Text("Batting Average: \(stat.AVGSoftball)")
                                            Text("On-base Plus Slugging: \(stat.OPSSoftball)")
                                            Text("Games Played - Games Started: \(stat.GPGSSoftball)")
                                            Text("At Bat: \(stat.ABSoftballb)")
                                            Text("Runs: \(stat.RSoftballb)")
                                        }
                                        Group {
                                            Text("Hits: \(stat.HSoftballb)")
                                            Text("Doubles: \(stat.doublesSoftballb)")
                                            Text("Triples: \(stat.triplesSoftballb)")
                                            Text("Home Runs: \(stat.HRSoftballb)")
                                            Text("Runs Batted In: \(stat.RBISoftball)")
                                            Text("Total Bases: \(stat.TBSoftball)")
                                            Text("Slugging %: \(stat.SLGPercentageSoftball)")
                                            Text("Walks: \(stat.BBSoftballb)")
                                            Text("Hit-By-Pitch: \(stat.HBPSoftballb)")
                                            Text("Strikeouts: \(stat.SOSoftballb)")
                                        }
                                        Group {
                                            Text("Ground-into-Double Play: \(stat.GDPSoftball)")
                                            Text("On-base %: \(stat.OBPercentageSoftball)")
                                            Text("Sacrifice Flies: \(stat.SFSoftball)")
                                            Text("Sacrifice Bunts: \(stat.SHSoftball)")
                                            Text("Stolen Bases/Attempts: \(stat.SBATTSoftball)")
                                        }
                                        Group {
                                            Text("Pitching")
                                            Text("Earned Run Average: \(stat.ERASoftball)")
                                            Text("Walks and Hits per Inning Pitched: \(stat.WHIPSoftball)")
                                            Text("Win-Loss Record: \(stat.WLSoftball)")
                                            Text("Appearances/Game Starts: \(stat.AppGSSoftball)")
                                            Text("Complete Games: \(stat.CGSoftball)")
                                            Text("Shutouts: \(stat.SHOSoftball)")
                                            Text("Saves: \(stat.SVSoftball)")
                                            Text("Innings Pitched: \(stat.IPSoftball)")
                                        }
                                        Group {
                                            Text("Hits: \(stat.HSoftballp)")
                                            Text("Runs: \(stat.RSoftballp)")
                                            Text("Earned Runs: \(stat.ERSoftball)")
                                            Text("Walks: \(stat.BBSoftballp)")
                                            Text("Strikeouts: \(stat.SOSoftballp)")
                                            Text("Doubles: \(stat.doublesSoftballp)")
                                            Text("Triples: \(stat.triplesSoftballp)")
                                            Text("Home Runs: \(stat.HRSoftballp)")
                                            Text("At Bat: \(stat.ABSoftballp)")
                                            Text("Batting Average Against: \(stat.BAVGSoftball)")
                                        }
                                        Group {
                                            Text("Wild Pitches: \(stat.WPSoftball)")
                                            Text("Hit-By-Pitches: \(stat.HBPSoftballp)")
                                            Text("Balks: \(stat.BKSoftball)")
                                            Text("Sacrifice Flies Allowed: \(stat.SFASoftball)")
                                            Text("Sacrifice Hits Allowed: \(stat.SHASoftball)")
                                        }
                                        Group {
                                            Text("Fielding")
                                            Text("Chances: \(stat.CSoftball)")
                                            Text("Putouts: \(stat.POSoftball)")
                                            Text("Assists: \(stat.ASoftball)")
                                            Text("Errors: \(stat.ESoftball)")
                                            Text("Fielding %: \(stat.FLDPercentageSoftball)")
                                            Text("Double-Plays Participated in: \(stat.DPSoftball)")
                                            Text("Stolen Bases Allowed: \(stat.SBASoftball)")
                                            Text("Caught Stealing By: \(stat.CSBSoftball)")
                                        }
                                        Group {
                                            Text("Passed Balls: \(stat.PBSoftballc)")
                                            Text("Catchers Interference: \(stat.CISoftballc)")
                                        }
                                    }
                            }
                            ForEach(dataManager.baseballStats, id: \.self) { stat in
                                Section(header: Text(stat.eventNameBaseB) + Text(Image(systemName: "baseball"))
                                    .font(.title2)
                                    .foregroundColor(.red)) {
                                        Group {
                                            Text("Batting")
                                            Text("Date: \(stat.eventDateBaseB)")
                                            Text("Location: \(stat.locationBaseB)")
                                            Text("Results: \(stat.resultInEventBaseB)")
                                            Text("Batting Average: \(stat.AVGBaseB)")
                                            Text("On-base Plus Slugging: \(stat.OPSBaseB)")
                                            Text("Games Played - Games Started: \(stat.GPGSBaseB)")
                                            Text("At Bat: \(stat.ABBaseBb)")
                                            Text("Runs: \(stat.RBaseBb)")
                                        }
                                        Group {
                                            Text("Hits: \(stat.HBaseBb)")
                                            Text("Doubles: \(stat.doublesBaseBb)")
                                            Text("Triples: \(stat.triplesBaseBb)")
                                            Text("Home Runs: \(stat.HRBaseBb)")
                                            Text("Runs Batted In: \(stat.RBIBaseB)")
                                            Text("Total Bases: \(stat.TBBaseB)")
                                            Text("Slugging %: \(stat.SLGPercentageBaseB)")
                                            Text("Walks: \(stat.BBBaseBb)")
                                            Text("Hit-By-Pitch: \(stat.HBPBaseBb)")
                                            Text("Strikeouts: \(stat.SOBaseBb)")
                                        }
                                        Group {
                                            Text("Ground-into-Double Play: \(stat.GDPBaseB)")
                                            Text("On-base %: \(stat.OBPercentageBaseB)")
                                            Text("Sacrifice Flies: \(stat.SFBaseB)")
                                            Text("Sacrifice Bunts: \(stat.SHBaseB)")
                                            Text("Stolen Bases/Attempts: \(stat.SBATTBaseB)")
                                        }
                                        Group {
                                            Text("Pitching")
                                            Text("Earned Run Average: \(stat.ERABaseB)")
                                            Text("Walks and Hits per Inning Pitched: \(stat.WHIPBaseB)")
                                            Text("Win-Loss Record: \(stat.WLBaseB)")
                                            Text("Appearances/Game Starts: \(stat.AppGSBaseB)")
                                            Text("Complete Games: \(stat.CGBaseB)")
                                            Text("Shutouts: \(stat.SHOBaseB)")
                                            Text("Saves: \(stat.SVBaseB)")
                                            Text("Innings Pitched: \(stat.IPBaseB)")
                                        }
                                        Group {
                                            Text("Hits: \(stat.HBaseBp)")
                                            Text("Runs: \(stat.RBaseBp)")
                                            Text("Earned Runs: \(stat.ERBaseB)")
                                            Text("Walks: \(stat.BBBaseBp)")
                                            Text("Strikeouts: \(stat.SOBaseBp)")
                                            Text("Doubles: \(stat.doublesBaseBp)")
                                            Text("Triples: \(stat.triplesBaseBp)")
                                            Text("Home Runs: \(stat.HRBaseBp)")
                                            Text("At Bat: \(stat.ABBaseBp)")
                                            Text("Batting Average Against: \(stat.BAVGBaseB)")
                                        }
                                        Group {
                                            Text("Wild Pitches: \(stat.WPBaseB)")
                                            Text("Hit-By-Pitches: \(stat.HBPBaseBp)")
                                            Text("Balks: \(stat.BKBaseB)")
                                            Text("Sacrifice Flies Allowed: \(stat.SFABaseB)")
                                            Text("Sacrifice Hits Allowed: \(stat.SHABaseB)")
                                        }
                                        Group {
                                            Text("Fielding")
                                            Text("Chances: \(stat.CBaseB)")
                                            Text("Putouts: \(stat.POBaseB)")
                                            Text("Assists: \(stat.ABaseB)")
                                            Text("Errors: \(stat.EBaseB)")
                                            Text("Fielding %: \(stat.FLDPercentageBaseB)")
                                            Text("Double-Plays Participated in: \(stat.DPBaseB)")
                                            Text("Stolen Bases Allowed: \(stat.SBABaseB)")
                                            Text("Caught Stealing By: \(stat.CSBBaseB)")
                                        }
                                        Group {
                                            Text("Passed Balls: \(stat.PBBaseBc)")
                                            Text("Catchers Interference: \(stat.CIBaseBc)")
                                        }
                                    }
                            }
                            
                        }
                    }
                
                
            }
        }.refreshable {
            dataManager.fetchTennisStats()
            dataManager.fetchLaxStats()
            dataManager.fetchBasketballStats()
            dataManager.fetchGolfStats()
            dataManager.fetchSoccerStats()
            dataManager.fetchSoftballStats()
            dataManager.fetchBaseballStats()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(DataManager())
    }
}
