//
//  Calendar.swift
//  GimmeStats
//
//  Created by Joey Yong and Christina Duvall on 11/17/22.
// https://sarunw.com/posts/swiftui-multidatepicker/
//

import SwiftUI

struct Calendar: View {
    
    @State private var date = Date()
    
    var body: some View {
        
        VStack {
            
            NavigationView {
                
                Text("Upcoming Events!")
                .navigationTitle("Calendar")
                .navigationBarItems(trailing: Button(action: {
                    //add
                }, label: {
                    Image(systemName: "plus")
                }))
             
            }
            
            
            DatePicker(
                    "Start Date",
                    selection: $date,
                    displayedComponents: [.date]
                )
                .datePickerStyle(.graphical)
                .padding()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
        }
        
    }
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
    }
}
