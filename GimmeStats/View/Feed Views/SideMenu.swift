//
//  SideMenu.swift
//  GimmeStats
//
//  Created by Joey Yong on 11/17/22.
//

import SwiftUI

struct SideMenu: View {
    
    @State var showMenu = false
    
    var body: some View {
        let drag = DragGesture()
            .onEnded {
                if $0.translation.width < -100 {
                    withAnimation {
                        self.showMenu = false
                    }
                }
            }
        return GeometryReader { geometry in
                    NavigationView {
                        GeometryReader { geometry in
                            ZStack(alignment:.leading)  {
                                if self.showMenu {
                                    MenuView()
                                        .frame(width: geometry.size.width/2)
                                        .transition(.move(edge: .leading))
                                }
                            }
                            .gesture(drag)
                        }
                        .navigationBarTitle("Gimme Stats", displayMode: .inline)
                        .navigationBarItems(leading: (
                            Button(action: {
                                withAnimation {
                                    self.showMenu.toggle()
                                }
                            }) {
                                Image(systemName: "line.horizontal.3")
                                    .imageScale(.large)
                            }
                        ))
                    }
                }
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu()
    }
}
