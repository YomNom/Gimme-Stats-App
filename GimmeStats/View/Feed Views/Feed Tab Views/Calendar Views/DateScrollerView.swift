//
//  DateScrollerView.swift
//  GimmeStats
//
//  Created by Christina Duvall on 11/20/22.
//

import SwiftUI

struct DateScrollerView: View {
    
    @EnvironmentObject var dateHolder: DateHolder
    
    var body: some View {
        HStack {
            Spacer()
            Button(action: previousMonth) {
                Image(systemName: "arrow.left")
                    .imageScale(.large)
                    font(Font.title.weight(.bold))
            }
            Text(CalendarHelper().monthYearString(dateHolder.date))
            Button(action: nextMonth) {
                Image(systemName: "arrow.right")
                    .imageScale(.large)
                    font(Font.title.weight(.bold))
            }
            Spacer()
            
            
        }
    }
    
    func previousMonth() {
        
    }
    
    func nextMonth() {
        
    }
}

struct DateScrollerView_Previews: PreviewProvider {
    static var previews: some View {
        DateScrollerView()
    }
}
