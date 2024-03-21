//
//  SportsTemplate.swift
//  GimmeStats
//
//  Created by Christina Duvall and Dylan Mordhorst on 11/21/22.
//

import SwiftUI

struct Sport: Hashable, Identifiable {
    let id = UUID()
    let name: String

}

struct SportDetails: View {
    
    @State private var newTemplate = false
    
    let sport: Sport
    
    var body: some View {
        VStack {
            Text("SPORT TEMPLATE")
            Text(sport.name)
            /*
            NavigationView {
                NavigationLink(sport.name, destination: Tennis(name: sport.name)) // change to template class
                } */
            }
            
        }
    }


struct SportsTemplateView: View {
    
    private var sports = [Sport(name: "Tennis"), Sport(name: "Lacrosse")]
    
    @State private var tennis = false
    @State private var lax = false
    @State private var soccer = false
    @State private var golf = false
    @State private var basketball = false
    @State private var baseball = false
    @State private var softball = false
    
    var body: some View {
        NavigationStack {
            VStack {/*
                List(sports) { sport in
                    Text(sport.name)
                    //NavigationLink(sport.name, value: sport)
                    //NavigationLink(sport.name, destination: //Tennis(name: sport.name))
                }//.navigationDestination(for: Sport.self) { sport in
                      //  SportDetails(sport: sport)
                    */
                HStack  {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.blue)
                            .frame(width: 200, height: 50)
                        Text("Tennis")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .onTapGesture {
                                self.tennis.toggle()
                            }
                            .sheet(isPresented: $tennis ) {
                                Tennis(name: "")
                            }
                    }
                }
                .padding()
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.blue)
                            .frame(width: 200, height: 50)
                        Text("Lacrosse")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .onTapGesture {
                                self.lax.toggle()
                            }
                            .sheet(isPresented: $lax ) {
                                Lacrosse()
                            }
                    }
                }
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.blue)
                            .frame(width: 200, height: 50)
                        Text("Soccer")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .onTapGesture {
                                self.soccer.toggle()
                            }
                            .sheet(isPresented: $soccer ) {
                                Soccer()
                            }
                    }
                }
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.blue)
                            .frame(width: 200, height: 50)
                        Text("Golf")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .onTapGesture {
                                self.golf.toggle()
                            }
                            .sheet(isPresented: $golf ) {
                                Golf()
                            }
                    }
                }
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.blue)
                            .frame(width: 200, height: 50)
                        Text("Basketball")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .onTapGesture {
                                self.basketball.toggle()
                            }
                            .sheet(isPresented: $basketball ) {
                                Basketball()
                            }
                    }
                }
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.blue)
                            .frame(width: 200, height: 50)
                        Text("Baseball")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .onTapGesture {
                                self.baseball.toggle()
                            }
                            .sheet(isPresented: $baseball ) {
                                Baseball()
                            }
                    }
                }
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.blue)
                            .frame(width: 200, height: 50)
                        Text("Softball")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .onTapGesture {
                                self.softball.toggle()
                            }
                            .sheet(isPresented: $softball ) {
                                Softball()
                            }
                    }
                }
                } .navigationTitle("Stat Templates")
                Spacer()
        }
        }
    }



struct SportsTemplateView_Previews: PreviewProvider {
    static var previews: some View {
        SportsTemplateView()
    }
}
