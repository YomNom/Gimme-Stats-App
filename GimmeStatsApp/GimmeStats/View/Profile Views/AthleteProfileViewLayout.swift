//
//  AthleteProfileView.swift
//  GimmeStats
//
//  Created by Christina Duvall on 10/22/22.
//

import SwiftUI

struct AthleteProfileView: View {
    var body: some View {
        VStack {
            Rectangle()
                .ignoresSafeArea(edges: .top)
                .frame(height:100)
                .foregroundColor(.blue)
            
            Circle()
                    .frame(height:150)
                    .offset(x: -110)
                        .offset(y: -90)
                        .padding(.bottom, -300)

                      VStack(alignment: .trailing) {
                          Text("Katie Robeson")
                              .font(.title)
                              .offset(x: 70)
                              .offset(y: -25)

                              Text("Anderson University")
                                  .font(.subheadline)
                                  .offset(x: 70)
                                  .offset(y: -25)
                          
                          Text("Upcoming Events!")
                              .font(.title2)
                              .foregroundColor(.orange)
                              
                          Spacer()
                          
                          Text("Stats!")
                              .font(.title2)
                              .foregroundColor(.orange)
                              .frame(alignment: .leading)
                              
                          
                              Spacer()
                      }
                      .padding()
                      Spacer()
        }
    }
}


struct AthleteProfileView_Previews: PreviewProvider {
    static var previews: some View {
        AthleteProfileView()
    }
}
