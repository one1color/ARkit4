//
//  ViewController.swift
//  testObject
//
//  Created by koki isshiki on 15.12.20.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let model = try! ModelEntity.load(named: "Untitled")
        
        model.generateCollisionShapes(recursive: true)
        arView.installGestures([.translation, .rotation], for: model!)
        
        let anchor: AnchorEntity = AnchorEntity(plane: .horizontal, classification: .any)
        arView.scene.addAnchor(anchor)
        anchor.addChild(model)
        
        
        }
}
