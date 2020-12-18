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
        
        let model1 = try! ModelEntity.loadModel(named: "sofa")
        let model2 = try! ModelEntity.loadModel(named: "leather_sofa")
        
        model1.generateCollisionShapes(recursive: true)
        model2.generateCollisionShapes(recursive: true)
        arView.installGestures([.translation, .rotation, .scale], for: model2)
        arView.installGestures([.translation, .rotation, .scale], for: model1)
        
        let anchor1: AnchorEntity = AnchorEntity(plane: .horizontal, classification: .any)
        let anchor2: AnchorEntity = AnchorEntity(plane: .horizontal, classification: .any)
        
        
        arView.scene.addAnchor(anchor1)
        arView.scene.addAnchor(anchor2)
        anchor1.addChild(model1)
        anchor2.addChild(model2)
        
        
        }
}
