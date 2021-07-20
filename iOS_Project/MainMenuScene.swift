//
//  MainMenuScene.swift
//  iOS_Project
//
//  Created by Aleksandra on 20/07/2021.
//  Copyright © 2021 Sergiusz Pietrala. All rights reserved.
//

import Foundation
import SpriteKit

class MainMenuScene: SKScene{
    override init(size: CGSize){
        super.init(size: size)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.black
        
        let start = SKLabelNode(fontNamed: "Chalkduster")
        start.text = "Start"
        start.name = "Start"
        start.fontSize = 65
        start.fontColor = SKColor.white
        start.position = CGPoint(x: size.width/2, y: size.height/2)
        
        addChild(start)
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>,
    with event: UIEvent?) {
       if let touch = touches.first{
        let location = touch.previousLocation(in: self)
        let node = self.nodes(at: location).first as? SKLabelNode
        
        if node?.name == "Start"{
            node?.fontColor = SKColor.green
            node?.fontSize = 60
        }
        
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
        let location = touch.previousLocation(in: self)
        let node = self.nodes(at: location).first as? SKLabelNode
        
        if node?.name == "Start"{
            let gameScene = GameScene(size: size)
            gameScene.scaleMode = scaleMode
            
            view?.presentScene(gameScene)
        }
        
        }
    }
}
