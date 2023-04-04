//
//  MainHeaderView.swift
//  GDDeezNutz
//
//  Created by Aaron Christopher Tanhar on 31/03/23.
//

import SwiftUI

struct MainHeaderView: View {
    @State var selection: Int? = nil

    var body: some View {
        HStack {
            Spacer()
            HStack(spacing: 20) {
                NavigationLink(destination: CreateProjectView(), tag: 1, selection: $selection) { EmptyView() }
                Button(action: { selection = 1 }) {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

struct MainHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MainHeaderView()
    }
}
