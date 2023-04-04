//
//  WhatsNext.swift
//  GDDeezNutz
//
//  Created by Aaron Christopher Tanhar on 31/03/23.
//

import SwiftUI

struct WhatsNext: View {
    var body: some View {
        VStack {
            Text("Select Story").font(.largeTitle).fontWeight(.bold)
            Spacer()
            Grid(horizontalSpacing: 20, verticalSpacing: 20) {
                GridRow {
                    Spacer()
                    VStack {
                        Image(systemName: "globe").resizable()
                            .frame(width: 100.0, height: 200.0)
                        Text("Time'sUp").font(.title)
                        Text("Banger as n")
                    }
                    Spacer()
                    VStack {
                        Image(systemName: "globe").resizable()
                            .frame(width: 100.0, height: 200.0)
                        Text("Time'sUp").font(.title)
                        Text("Banger as n")
                    }
                    Spacer()
                }
                GridRow {
                    Spacer()
                    VStack {
                        Image(systemName: "globe").resizable()
                            .frame(width: 100.0, height: 200.0)
                        Text("Time'sUp").font(.title)
                        Text("Banger as n")
                    }
                    Spacer()
                    VStack {
                        Image(systemName: "globe").resizable()
                            .frame(width: 100.0, height: 200.0)
                        Text("Time'sUp").font(.title)
                        Text("Banger as n")
                    }
                    Spacer()
                }
            }
            Spacer()
        }
    }
}

struct WhatsNext_Previews: PreviewProvider {
    static var previews: some View {
        WhatsNext()
    }
}
