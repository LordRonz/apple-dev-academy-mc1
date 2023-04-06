//
//  Sketcher.swift
//  GDDeezNutz
//
//  Created by Aaron Christopher Tanhar on 05/04/23.
//

import SwiftUI

struct Line {
    var points = [CGPoint]()
    var color: Color = .red
    var lineWidth: Double = 1.0
}

struct Sketcher: View {
    @State private var currentLine = Line()
    @State private var lines: [Line] = []
    @State private var thickness: Double = 1.0

    var body: some View {
        VStack {
            Canvas { context, _ in

                for line in lines {
                    var path = Path()
                    path.addLines(line.points)
                    context.stroke(path, with: .color(line.color), lineWidth: line.lineWidth)
                }
            }
            .frame(minWidth: 400, minHeight: 400)
            .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                .onChanged { value in
                    let newPoint = value.location
                    currentLine.points.append(newPoint)
                    self.lines.append(currentLine)
                }
                .onEnded { _ in
                    self.lines.append(currentLine)
                    self.currentLine = Line(points: [], color: currentLine.color, lineWidth: thickness)
                }
            ).border(.black)

            HStack {
                Slider(value: $thickness, in: 1 ... 20) {
                    Text("Thickness")
                }.frame(maxWidth: 200)
                    .onChange(of: thickness) { newThickness in
                        currentLine.lineWidth = newThickness
                    }
                Divider()
                ColorPickerView(selectedColor: $currentLine.color)
                    .onChange(of: currentLine.color) { newColor in
                        print(newColor)
                        currentLine.color = newColor
                    }
            }

        }.padding()
            .navigationTitle("Sketch")
    }
}

struct Sketcher_Previews: PreviewProvider {
    static var previews: some View {
        Sketcher()
    }
}
