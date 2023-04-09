//
//  ChecklistView.swift
//  GDDeezNutz
//
//  Created by Aaron Christopher Tanhar on 06/04/23.
//

import SwiftUI

struct Section: Identifiable {
    var id = UUID()
    var title: String
    var contents: [Subsection]
}

struct Subsection: Identifiable {
    var id = UUID()
    var content: String
}

extension Section {
    static let samples = [
        Section(title: "Part 1", contents: [Subsection(content: "Game content"), Subsection(content: "Game content")]),
        Section(title: "Part 2", contents: [Subsection(content: "Game content"), Subsection(content: "Game content")]),
        Section(title: "Part 3", contents: [Subsection(content: "Game content"), Subsection(content: "Game content")]),
    ]
}

private class SectionModel: ObservableObject {
    @Published var sections: [Section] = Section.samples
}

@MainActor
struct ChecklistView: View {
    @StateObject fileprivate var sectionModel = SectionModel()
    let navigationTitle: String
    var body: some View {
        VStack {
            List(sectionModel.sections) { section in
                Text(section.title).fontWeight(.bold).font(.title2)
                ForEach(section.contents) { subsection in
                    MindMapItemRow(label: subsection.content)
                }
            }
        }.navigationTitle(navigationTitle)
            .toolbar {
                ToolbarItem {
                    ShareLink("Export PDF", item: render())
                }
            }
    }

    func render() -> URL {
        // 1: Render Hello World with some modifiers
        let renderer = ImageRenderer(content:
            GDDExample().frame(width: 600)
        )

        // 2: Save it to our documents directory
        let url = URL.documentsDirectory.appending(path: "output.pdf")

        // 3: Start the rendering process
        renderer.render { size, context in
            // 4: Tell SwiftUI our PDF should be the same size as the views we're rendering
            var box = CGRect(x: 0, y: 0, width: size.width, height: size.height)

            // 5: Create the CGContext for our PDF pages
            guard let pdf = CGContext(url as CFURL, mediaBox: &box, nil) else {
                return
            }

            // 6: Start a new PDF page
            pdf.beginPDFPage(nil)

            // 7: Render the SwiftUI view data onto the page
            context(pdf)

            // 8: End the page and close the file
            pdf.endPDFPage()
            pdf.closePDF()
        }

        return url
    }
}

struct ChecklistView_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistView(navigationTitle: "Checklist")
    }
}
