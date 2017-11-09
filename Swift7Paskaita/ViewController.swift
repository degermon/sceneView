//
//  ViewController.swift
//  Swift7Paskaita
//
//  Created by Daniel Suskevic on 03/11/2017.
//  Copyright © 2017 Daniel Suskevic. All rights reserved.
//

import UIKit
import SceneKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sceneView: SCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setup()
    }
    
    func setup() {
        let sce = scene()
        camera()
        //light(scene: sce)
        let col = color()
        figure(scene: sce, color : col)
    }
    
    func scene() -> SCNScene {
        let scene = SCNScene()
        sceneView.scene = scene
        sceneView.allowsCameraControl = true
        sceneView.autoenablesDefaultLighting = true
        return scene
    }
    
    func camera() {
        let camera = SCNCamera()
        let cameraNode = SCNNode()
        cameraNode.camera = camera
        cameraNode.position = SCNVector3Make(0.0, 0.0, 3.0)
        }
    
   /* func light(scene : SCNScene) {
        let light = SCNLight()
        light.type = SCNLight.LightType.omni
        let lightNode = SCNNode()
        lightNode.light = light
        lightNode.position = SCNVector3Make(10.0, 10.0, 10.0)
        scene.rootNode.addChildNode(lightNode)
    } */
    
    func figure(scene : SCNScene, color : [SCNMaterial]) {
        let coneGeometry = SCNCone(topRadius: 0.0, bottomRadius: 4.0, height: 4.0)
        let coneNode = SCNNode(geometry: coneGeometry)

        let cubeGeometry = SCNBox(width: 2, height: 2, length: 2, chamferRadius: 0.5)
        let cubeNode = SCNNode(geometry: cubeGeometry)
        cubeNode.position = SCNVector3Make(2, 2, 2)
        
        cubeGeometry.materials = [color[0]]
        scene.rootNode.addChildNode(cubeNode)
        
        coneGeometry.materials = [color[1]]
        scene.rootNode.addChildNode(coneNode)
    }
    
    
    func color() -> [SCNMaterial] {
        var redMaterial : [SCNMaterial] = [SCNMaterial(), SCNMaterial()]
        //redMaterial.diffuse.contents = UIColor.red
        
        redMaterial[0].diffuse.contents = UIImage(named: "meal")
        redMaterial[1].diffuse.contents = UIImage(named: "JETWOMAN")

        return redMaterial
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

