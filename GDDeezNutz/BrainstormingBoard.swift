//
//  BrainstormingBoard.swift
//  GDDeezNutz
//
//  Created by Aaron Christopher Tanhar on 06/04/23.
//

import MarkupEditor
import SwiftUI

struct BrainstormingBoard: View {
    @State private var demoHtml: String = "Hello World"
    @State var selection: Int? = nil

    var body: some View {
        VStack {
            MarkupEditorView(html: $demoHtml)
        }.navigationTitle("Brainstorming Board")
            .toolbar {
                ToolbarItem {
                    HStack {
                        HStack(spacing: 20) {
                            NavigationLink(destination: Sketcher(), tag: 1, selection: $selection) { EmptyView() }
                            Button(action: { selection = 1 }) {
                                Image(systemName: "pencil.line")
                            }
                        }
                    }
                }
            }
    }
}

struct BrainstormingBoard_Previews: PreviewProvider {
    static var previews: some View {
        BrainstormingBoard()
    }
}
