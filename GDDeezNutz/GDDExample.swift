//
//  GDDExample.swift
//  GDDeezNutz
//
//  Created by Aaron Christopher Tanhar on 07/04/23.
//

import SwiftUI

struct GDDExample: View {
    var body: some View {
            VStack(alignment: .leading, spacing: 50) {
                Text("Game Design Document").font(.title).fontWeight(.bold)
                VStack(alignment: .leading, spacing: 5) {
                    Text("Core Concept").font(.title2).fontWeight(.semibold)
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum ").font(.body).fontWeight(.semibold)
                }
                VStack(alignment: .leading, spacing: 5) {
                    Text("Main Features").font(.title2).fontWeight(.semibold)
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum ").font(.body).fontWeight(.semibold)
                }
                VStack(alignment: .leading, spacing: 5) {
                    Text("Target Platform").font(.title2).fontWeight(.semibold)
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum ").font(.body).fontWeight(.semibold)
                }
            }.padding()
    }
}

struct GDDExample_Previews: PreviewProvider {
    static var previews: some View {
        GDDExample()
    }
}
