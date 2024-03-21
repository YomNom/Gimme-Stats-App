//
//  Calendar.swift
//  GimmeStats
//
//  Created by Joey Yong and Christina Duvall on 11/17/22.
//
// https://sarunw.com/posts/swiftui-multidatepicker/


import SwiftUI
import Firebase

struct Event: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var eventName: String
    var eventStart: String
    var eventEnd: String
    var location: String
    var notifySpectators: String
    var eventsParticipatedIn: String
}

struct Calendar: View {
    
    @State private var date = Date()
    @State private var events = [Event]()
    @State private var newEvent = false
    
    @EnvironmentObject var dataManager: DataManager

    
    var body: some View {
        VStack {
            NavigationView {
                ZStack {
                    Text("")
                        .navigationTitle("Schedule")
                        .navigationBarItems(trailing: Button(action: {
                            self.newEvent.toggle()
                        }, label: {
                            Image(systemName: "plus")
                                .sheet(isPresented: $newEvent){
                                    NewEventTemplate()
                                }
                        }))
                    VStack {
                        List() {
                            ForEach(dataManager.userEvents, id: \.self) { event in
                                Section(header: Text(event.eventName)) {
                                    Text("From \(event.eventStart) to \(event.eventEnd)")
                                }
                            }
                        }
                    }
                }
            }
            
            
        }
        .refreshable {
            dataManager.fetchCalendar()
        }
        .navigationTitle("Calendar")
        .navigationBarItems(trailing: Button(action: {
            self.newEvent.toggle()
        }, label: {
            Image(systemName: "plus")
                .sheet(isPresented: $newEvent){
                    NewEventTemplate()
                }
        }))
        
    } // body
}

struct MultiDatePickerExample: View {
    @State private var dates: Set<DateComponents> = []


    var body: some View {
        MultiDatePicker("Dates Available", selection: $dates)
            .fixedSize()
    }
}

struct Calendar_Previews: PreviewProvider {
    static var previews: some View {
        Calendar()
            .environmentObject(DataManager())
    }
}

