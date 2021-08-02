//
//  MainMenuScene.swift
//  iOS_Project
//
//  Created by Sergiusz Pietrala on 20/07/2021.
//  Copyright © 2021 Sergiusz Pietrala. All rights reserved.
//

import Foundation
import SpriteKit

class MainMenuScene: SKScene{
    var screenState = 0
    var type = 0;
    
    override init(size: CGSize){
        super.init(size: size)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        initializeMainScreen()
    }
    
    func initializeMainScreen(){
        removeAllChildren()
        backgroundColor = SKColor.black
        
        let start = SKLabelNode(fontNamed: "Chalkduster")
        start.text = "Start"
        start.name = "Start"
        start.fontSize = 80
        start.fontColor = SKColor.white
        start.position = CGPoint(x: 0, y: 0)
        
        addChild(start)
        
        let modes = SKLabelNode(fontNamed: "Chalkduster")
        modes.text = "Modes"
        modes.name = "Modes"
        modes.fontSize = 70
        modes.fontColor = SKColor.white
        modes.position = CGPoint(x: 0, y: -200)
        
        addChild(modes)
        
        let mode = SKLabelNode(fontNamed: "Chalkduster")
        if(type == 0){
            mode.text = "Animals"
        }
        if(type == 1){
            mode.text = "Flags"
        }
        mode.name = "Type"
        mode.fontSize = 60
        mode.fontColor = SKColor.lightGray
        mode.position = CGPoint(x: 0, y: -600)
        
        addChild(mode)
        
        screenState = 0
    }
    
    func initializeModeScreen(){
        removeAllChildren()
        let animals = SKLabelNode(fontNamed: "Chalkduster")
        animals.text = "Animals"
        animals.name = "Animals"
        animals.fontSize = 70
        animals.fontColor = SKColor.white
        animals.position = CGPoint(x: 0, y: 200)
        
        addChild(animals)
        
        let flags = SKLabelNode(fontNamed: "Chalkduster")
        flags.text = "Flags"
        flags.name = "Flags"
        flags.fontSize = 70
        flags.fontColor = SKColor.white
        flags.position = CGPoint(x: 0, y: 0)
        
        addChild(flags)
        
        screenState = 1
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        if let touch = touches.first{
            let location = touch.previousLocation(in: self)
            let node = self.nodes(at: location).first as? SKLabelNode
            
            if(node != nil && node?.name !=  "Type"){
                node?.fontColor = SKColor.green
                node?.fontSize = 60
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            let location = touch.previousLocation(in: self)
            let node = self.nodes(at: location).first as? SKLabelNode
            
            if(node != nil){
            if(screenState == 0){
                if node?.name == "Start"{
                    let gameScene = GameScene(size: size)
                    gameScene.scaleMode = scaleMode
                    gameScene.anchorPoint = CGPoint(x: 0.5, y: 0.2)
                    gameScene.type = type
                    view?.presentScene(gameScene)
                }
                if node?.name == "Modes"{
                    initializeModeScreen()
                }
            }else if(screenState == 1){
                if node?.name == "Animals"{
                    type = 0
                }
                if node?.name == "Flags"{
                    type = 1
                }
                initializeMainScreen()
            }
            }
            
            
        }
    }
}
