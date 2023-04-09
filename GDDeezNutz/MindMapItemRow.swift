//
//  MindMapItemRow.swift
//  GDDeezNutz
//
//  Created by Aaron Christopher Tanhar on 06/04/23.
//

import SwiftUI



struct MindMapItemRow: View {
    @State private var toggled = false
    let label: String
    var body: some View {
        HStack {
            Toggle(isOn: $toggled) {
                Text(label)
            }
        }
    }
}

struct MindMapItemRow_Previews: PreviewProvider {
    static var previews: some View {
        MindMapItemRow(label: "Game Content")
    }
}
