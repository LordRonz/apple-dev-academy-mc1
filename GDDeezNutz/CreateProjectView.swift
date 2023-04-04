//
//  CreateProjectView.swift
//  GDDeezNutz
//
//  Created by Aaron Christopher Tanhar on 03/04/23.
//

import SwiftUI

struct CreateProjectView: View {
    @State private var projectName = ""
    @State var selection: Int? = nil
    var body: some View {
        VStack {
            HStack {
                TextField(text: $projectName, prompt: Text("Project Name")) {
                    Text("Project Name")
                }.disableAutocorrection(true)
                    .border(.secondary)
            }.textFieldStyle(.roundedBorder)
            Button("Create", action: { selection = 1 }).buttonStyle(.borderedProminent)
        }.padding()
            .navigationTitle("Create Project")
        NavigationLink(destination: MindMapView(), tag: 1, selection: $selection) { EmptyView() }
    }
}

struct CreateProjectView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProjectView()
    }
}
