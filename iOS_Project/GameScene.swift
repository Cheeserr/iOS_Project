//
//  GameScene.swift
//  iOS_Project
//
//  Created by Aleksandra on 12/07/2021.
//  Copyright © 2021 Sergiusz Pietrala. All rights reserved.
//

import SpriteKit

class GameScene: SKScene{
    
    var cardTouched = false
    var toCheck: [Card] = []
    
    override func didMove(to view: SKView){
        var set: Set<Card> = []
        
        backgroundColor = SKColor.white
        let card1 = Card(imageNamed: "cowGame")
        card1.name = "cow"
        card1.position = CGPoint(x: 0, y: 0)
        card1.setScale(0.1)
        set.insert(card1)
        addChild(card1)
        
        let card2 = Card(imageNamed: "elephantGame")
        card2.name = "elephant"
        card2.position = CGPoint(x: 250, y: 0)
        card2.setScale(0.05)
        set.insert(card1)
        addChild(card2)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>,
    with event: UIEvent?) {
       if let touch = touches.first{
        let location = touch.previousLocation(in: self)
        let node = self.nodes(at: location).first as? Card
        
        if node?.pressed == false{
            node?.pressed = true
            toCheck.append(node!)
            print("Card pressed")
            // TURN CARD
            if(cardTouched){
                checkMatch(set: toCheck)
                toCheck.removeAll()
            }else{
                cardTouched = true
            }
            }
        }
    }
    
    func checkMatch(set: [Card]){
        if(set[0].id != set[1].id){
            set[0].pressed = false
            set[1].matched = false
        }
            cardTouched = false
    }
}
