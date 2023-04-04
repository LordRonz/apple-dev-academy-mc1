//
//  AddProjectModal.swift
//  GDDeezNutz
//
//  Created by Aaron Christopher Tanhar on 03/04/23.
//

import SwiftUI

struct AddProjectModal: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()

            VStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "x.circle")
                        .foregroundColor(.black)
                        .font(.largeTitle)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .trailing)
                Spacer()
            }

            Text("This is the second one")
                .font(.title2.weight(.heavy))
        }
    }
}

struct AddProjectModal_Previews: PreviewProvider {
    static var previews: some View {
        AddProjectModal()
    }
}
