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
        backgroundColor = SKColor.white
        
        var set: Set<Card> = []
        let cardDistance = 250
        
        for _ in 0...11{
            let card = Card(imageNamed: "cowGame")
            set.insert(card)
        }
        var value = -1
        var value2 = 0
        for cards in set{
            cards.setScale(0.1)
            cards.position = CGPoint(x: value * cardDistance , y: value2 * cardDistance)
            value += 1
            if(value > 1){
                value = -1
                value2 += 1
            }
            addChild(cards)
        }
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
            set[1].pressed = false
        }
            cardTouched = false
    }
}
