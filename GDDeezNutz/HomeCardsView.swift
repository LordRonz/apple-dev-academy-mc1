//
//  HomeCardsView.swift
//  GDDeezNutz
//
//  Created by Aaron Christopher Tanhar on 31/03/23.
//

import SwiftUI

struct HomeCardsView: View {
    @State var selection: Int? = nil
    let projects: Projects
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "doc.fill")
                    .resizable()
                    .frame(width: 32.0, height: 40.0)
            }.padding().background(.gray)
            VStack(alignment: .leading) {
                Text(projects.title).fontWeight(.bold).font(.title2)
                Text(projects.description)
            }.padding(.trailing)
            NavigationLink(destination: MindMapView(projectName: projects.title), tag: 2, selection: $selection) { EmptyView() }.hidden().frame(width: 0, height: 0)
            Spacer()
        }.border(.gray).cornerRadius(20).onTapGesture {
            selection = 2
        }
    }
}

struct HomeCardsView_Previews: PreviewProvider {
    static var project = Projects.sampleData[0]
    static var previews: some View {
        HomeCardsView(projects: project)
    }
}
