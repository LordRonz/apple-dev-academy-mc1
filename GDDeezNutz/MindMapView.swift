//
//  MindMapView.swift
//  GDDeezNutz
//
//  Created by Aaron Christopher Tanhar on 04/04/23.
//

import SpriteKit
import SwiftUI

// A simple game scene with falling boxes
class GameScene: SKScene {
    override func didMove(to view: SKView) {
        let cameraNode = SKCameraNode()

        cameraNode.position = scene != nil ? CGPoint(x: (scene?.size.width ?? 0) / 2,
                                                     y: (scene?.size.height ?? 0) / 2) : CGPoint(x: 0, y: 0)

        scene?.addChild(cameraNode)
        scene?.camera = cameraNode

        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        let shape = SKShapeNode()
        shape.path = UIBezierPath(roundedRect: CGRect(x: -128, y: -128, width: 256, height: 256), cornerRadius: 64).cgPath
        shape.position = CGPoint(x: frame.midX, y: frame.midY)
        shape.fillColor = UIColor.red
        shape.strokeColor = UIColor.blue
        shape.lineWidth = 10
        addChild(shape)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let box = SKSpriteNode(color: .red, size: CGSize(width: 50, height: 50))
        box.position = location
        box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 50, height: 50))
        addChild(box)
        camera?.position = box.position
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

    var scene: SKScene {
        let scene = GameScene()
        scene.size = CGSize(width: 300, height: 400)
        scene.scaleMode = .fill
        return scene
    }

    var body: some View {
        VStack { SpriteView(scene: scene)
            .frame(width: 300, height: 400)
            .ignoresSafeArea()
        }.padding()
            .navigationTitle("Mind Map")
            .toolbar {
                ToolbarItem {
                    Button("Export", action: { isPresentingExport = true
                    }).confirmationDialog("Are you sure?",
                                          isPresented: $isPresentingExport)
                    {
                        Button("Preview GDD") {
                            print("Yo")
                        }
                        Button("Export GDD as PDF") {
                            print("Yo")
                        }
                        Button("Export GDD as JPG") {
                            print("Yo")
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

struct MindMapView_Previews: PreviewProvider {
    static var previews: some View {
        MindMapView()
    }
}