//
//  ColorPickerView.swift
//  GDDeezNutz
//
//  Created by Aaron Christopher Tanhar on 05/04/23.
//

import SwiftUI

struct ColorPickerView: View {
    let colors = [Color.red, Color.orange, Color.green, Color.blue, Color.purple, Color.white]
    @Binding var selectedColor: Color

    var body: some View {
        HStack {
            ForEach(colors, id: \.self) { color in
                Image(systemName: selectedColor == color ? Constants.Icons.recordCircleFill : Constants.Icons.circleFill)
                    .foregroundColor(color)
                    .font(.system(size: 16))
                    .clipShape(Circle())
                    .onTapGesture {
                        selectedColor = color
                    }.border(.black).cornerRadius(10)
            }
        }
    }
}

struct ColorListView_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerView(selectedColor: .constant(.blue))
    }
}
