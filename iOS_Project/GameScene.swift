//
//  GameScene.swift
//  iOS_Project
//
//  Created by Aleksandra on 12/07/2021.
//  Copyright © 2021 Sergiusz Pietrala. All rights reserved.
//

import SpriteKit

class GameScene: SKScene{
    override func didMove(to view: SKView){
        backgroundColor = SKColor.white
        
        let card1 = Card(imageNamed: "cowGame")
        card1.name = "cow"
        card1.position = CGPoint(x: size.width/2, y: size.height/2)
        card1.setScale(0.1)
        addChild(card1)
        
        let card2 = Card(imageNamed: "elephantGame")
        card2.name = "elephant"
        card2.position = CGPoint(x: size.width/2 + 100, y: size.height/2 + 100)
        card2.setScale(0.05)
        addChild(card2)

    }
    
    override func touchesBegan(_ touches: Set<UITouch>,
    with event: UIEvent?) {
       if let touch = touches.first{
        let location = touch.previousLocation(in: self)
        let node = self.nodes(at: location).first
        
        if node?.name == "cow"{
            print("Cow pressed")
        }
        if node?.name == "elephant"{
            print("Elephant pressed")
        }
        
        }
    }
}
