//
//  MindMapView.swift
//  GDDeezNutz
//
//  Created by Aaron Christopher Tanhar on 04/04/23.
//

import SpriteKit
import SwiftUI

func adjustLabelFontSizeToFitRect(labelNode: SKLabelNode, rect: CGRect) {
    // Determine the font scaling factor that should let the label text fit in the given rectangle.
    let scalingFactor = min(rect.width / labelNode.frame.width, rect.height / labelNode.frame.height)

    // Change the fontSize.
    labelNode.fontSize *= scalingFactor * 0.9

    // Optionally move the SKLabelNode to the center of the rectangle.
    labelNode.position = CGPoint(x: rect.midX, y: rect.midY - labelNode.frame.height / 2.0)
}

func makeShape(posX: CGFloat, posY: CGFloat, content: String, width: Int=256, height: Int = 200) -> (SKNode, SKLabelNode) {
    let shape = SKShapeNode()
    let rect = CGRect(x: -128, y: -128, width: width, height: height)
    shape.name = "main_node"
    shape.path = UIBezierPath(roundedRect: rect, cornerRadius: 64).cgPath
    shape.position = CGPoint(x: posX, y: posY)
    shape.fillColor = UIColor.red
    shape.strokeColor = UIColor.blue
    let myLabel = SKLabelNode(fontNamed: UIFont.boldSystemFont(ofSize: 16).fontName)
    myLabel.text = content
    myLabel.fontSize = 60
    adjustLabelFontSizeToFitRect(labelNode: myLabel, rect: rect)
    myLabel.position = CGPointMake(shape.frame.midX, shape.frame.midY)
    myLabel.fontColor = UIColor.black
    myLabel.verticalAlignmentMode = .center
    myLabel.horizontalAlignmentMode = .center
    shape.lineWidth = 10
    return (shape, myLabel)
}

// A simple game scene with falling boxes
class GameScene: SKScene {
    var projectName = ""
    var action: (() -> Void)?
    var previousCameraPoint = CGPoint.zero
    @Environment(\.colorScheme) var colorScheme: ColorScheme

    override func didMove(to view: SKView) {
        if colorScheme != .dark {
            backgroundColor = .white
        }
        let cameraNode = SKCameraNode()

        cameraNode.position = scene != nil ? CGPoint(x: (scene?.size.width ?? 0) / 2,
                                                     y: (scene?.size.height ?? 0) / 2) : CGPoint(x: 0, y: 0)

        scene?.addChild(cameraNode)
        scene?.camera = cameraNode
        let shapes = makeShape(posX: frame.midX, posY: frame.midY, content: projectName)
        let shape = shapes.0
        let myLabel = shapes.1
        
        let shapesDefinitions = [
            [frame.midX - 300, frame.midY, "Title", 150, 150] as [Any],
            [frame.midX + 500, frame.midY, "Story", 150, 150] as [Any]
        ]
        
        var nodesToBeDrawed: [SKNode] = []
        var labelsToBeDrawed: [SKLabelNode] = []
        
        let shapes1 = makeShape(posX: frame.midX - 300, posY: frame.midY, content: "Title", width: 150, height: 150)
        let shape1 = shapes1.0
        let myLabel1 = shapes1.1

        let shapes2 = makeShape(posX: frame.midX + 500, posY: frame.midY, content: "Story", width: 150, height: 150)
        let shape2 = shapes2.0
        let myLabel2 = shapes2.1
        
        for n in shapesDefinitions {
            let s = makeShape(posX: n[0] as! CGFloat, posY: n[1] as! CGFloat, content: n[2] as! String, width: n[3] as! Int, height: n[4] as! Int)
            nodesToBeDrawed.append(s.0)
            labelsToBeDrawed.append(s.1)
        }

        let panGesture = UIPanGestureRecognizer()
        panGesture.addTarget(self, action: #selector(panGestureAction(_:)))
        view.addGestureRecognizer(panGesture)
        
        for s in nodesToBeDrawed {
            var yourline = SKShapeNode()
            var pathToDraw = CGMutablePath()
            pathToDraw.move(to: CGPoint(x: shape.frame.midX, y: shape.frame.midY))
            pathToDraw.addLine(to: CGPoint(x: s.frame.midX, y: shape.frame.midY))
            yourline.path = pathToDraw
            yourline.strokeColor = SKColor.red
            addChild(yourline)
        }

        addChild(shape)
        addChild(myLabel)
        for node in nodesToBeDrawed {
            addChild(node)
        }
        for node in labelsToBeDrawed {
            addChild(node)
        }
    }

    @objc func panGestureAction(_ sender: UIPanGestureRecognizer) {
        // The camera has a weak reference, so test it
        guard let camera = camera else {
            return
        }
        // If the movement just began, save the first camera position
        if sender.state == .began {
            previousCameraPoint = camera.position
        }
        // Perform the translation
        let translation = sender.translation(in: view)
        let newPosition = CGPoint(
            x: previousCameraPoint.x + translation.x * -1,
            y: previousCameraPoint.y + translation.y
        )
        camera.position = newPosition
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let touchedNodes = nodes(at: location)
        if let name = atPoint(location).name {
            if name == "main_node" {
                action?()
            }
        }
//        let box = SKSpriteNode(color: .red, size: CGSize(width: 50, height: 50))
//        box.position = location
//        box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 50, height: 50))
//        addChild(box)
//        camera?.position = box.position
    }

//    var previousCameraPoint = CGPoint.zero
//
//    @objc func panGestureAction(_ sender: UIPanGestureRecognizer) {
//        // The camera has a weak reference, so test it
//        guard let camera = camera else {
//            return
//        }
//        // If the movement just began, save the first camera position
//        if sender.state == .began {
//            previousCameraPoint = camera.position
//        }
//        // Perform the translation
//        let translation = sender.translation(in: view)
//        let newPosition = CGPoint(
//            x: previousCameraPoint.x + translation.x * -1,
//            y: previousCameraPoint.y + translation.y
//        )
//        camera.position = newPosition
//    }
}

struct MindMapView: View {
    @State private var isPresentingExport: Bool = false
    @State var selection: Int? = nil
    let projectName: String

    func add() {
        selection = 1
    }

    var scene: SKScene {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let gameScene = GameScene()
        gameScene.size = CGSize(width: screenWidth, height: screenHeight)
        gameScene.scaleMode = .fill
        gameScene.projectName = projectName
        gameScene.action = add
        return gameScene
    }

    var body: some View {
        GeometryReader { geometry in
            VStack { SpriteView(scene: scene)
                .frame(width: geometry.size.width, height: geometry.size.height)
                NavigationLink(destination: BrainstormingBoard(), tag: 1, selection: $selection) { EmptyView() }.hidden().frame(width: 0, height: 0)
                NavigationLink(destination: ChecklistView(navigationTitle: "Preview GDD"), tag: 3, selection: $selection) { EmptyView() }.hidden().frame(width: 0, height: 0)
                NavigationLink(destination: ChecklistView(navigationTitle: "Export GDD as PDF"), tag: 4, selection: $selection) { EmptyView() }.hidden().frame(width: 0, height: 0)
                NavigationLink(destination: ChecklistView(navigationTitle: "Export GDD as JPG"), tag: 5, selection: $selection) { EmptyView() }.hidden().frame(width: 0, height: 0)
            }
            .navigationTitle("Mind Map")
            .toolbar {
                ToolbarItem {
                    Button("Export", action: { isPresentingExport = true
                    }).confirmationDialog("Are you sure?",
                                          isPresented: $isPresentingExport)
                    {
                        Button("Preview GDD") {
                            selection = 3
                        }
                        Button("Export GDD as PDF") {
                            selection = 4
                        }
                        Button("Export GDD as JPG") {
                            selection = 5
                        }
                        Button("Export Mind Map as PDF") {
                            print("Yo")
                        }
                        Button("Export Mind Map as JPG") {
                            print("Yo")
                        }
                    }
                }
            }
        }
    }
}

struct MindMapView_Previews: PreviewProvider {
    static var previews: some View {
        MindMapView(projectName: "Deez Nutz")
    }
}
