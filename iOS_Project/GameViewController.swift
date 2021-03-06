//
//  GameViewController.swift
//  iOS_Project
//
//  Created by Sergiusz Pietrala on 12/07/2021.
//  Copyright © 2021 Sergiusz Pietrala. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        let scene =
            MainMenuScene(size:CGSize(width: 1536, height: 2048))
        scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .aspectFill
        skView.presentScene(scene)
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
}
