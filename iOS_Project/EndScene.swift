//
//  EndScene.swift
//  iOS_Project
//
//  Created by Sergiusz Pietrala on 22/07/2021.
//  Copyright © 2021 Sergiusz Pietrala. All rights reserved.
//

import Foundation
import SpriteKit

class EndScene: SKScene{
    
    var moves = 0
    
    override init(size: CGSize){
        super.init(size: size)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMove(to view: SKView) {
        backgroundColor = SKColor.blue
        
        let start = SKLabelNode(fontNamed: "Chalkduster")
        if(moves <= 6){
        start.text = "Perfect!"
        }else if(moves <= 9){
            start.text = "Well done"
        }else{
            start.text = "Try Again"
        }
        start.name = "Game Over"
        start.fontSize = 80
        start.fontColor = SKColor.white
        start.position = CGPoint(x: 0, y: 0)
        
        addChild(start)
        
        let mainMenu = SKLabelNode(fontNamed: "Chalkduster")
        mainMenu.text = "Main Menu"
        mainMenu.name = "Main Menu"
        mainMenu.fontSize = 70
        mainMenu.fontColor = SKColor.white
        mainMenu.position = CGPoint(x: 0, y: -400)
        
        addChild(mainMenu)
        
        let movesCount = SKLabelNode(fontNamed: "Chalkduster")
        movesCount.text = "Moves : " + String(moves)
        movesCount.name = "MoveCount"
        movesCount.fontSize = 70
        movesCount.fontColor = SKColor.white
        movesCount.position = CGPoint(x: 0, y: -600)
        
        addChild(movesCount)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>,
    with event: UIEvent?) {
       if let touch = touches.first{
        let location = touch.previousLocation(in: self)
        let node = self.nodes(at: location).first as? SKLabelNode
        
        if node?.name == "Main Menu"{
            node?.fontColor = SKColor.green
            node?.fontSize = 60
        }
        
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
        let location = touch.previousLocation(in: self)
        let node = self.nodes(at: location).first as? SKLabelNode
        
        if node?.name == "Main Menu"{
            let gameScene = MainMenuScene(size: size)
            gameScene.scaleMode = scaleMode
            gameScene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            view?.presentScene(gameScene)
        }
        
        }
    }
}
