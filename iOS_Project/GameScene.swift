//
//  GameScene.swift
//  iOS_Project
//
//  Created by Sergiusz Pietrala on 12/07/2021.
//  Copyright © 2021 Sergiusz Pietrala. All rights reserved.
//

import SpriteKit

class GameScene: SKScene{
    
    var cardTouched = false
    var toCheck: [Card] = []
    var matches = 0
    
    override func didMove(to view: SKView){
        backgroundColor = SKColor.white
        
        var set: Set<Card> = []
        
        let cardDistanceX = 250
        let cardDistanceY = 400
        var value = -1
        var value2 = 0
        
        for i in 1...12{
            
            let card = Card(imageNamed: String(i/2))
            card.id = i/2
            set.insert(card)
        }
        
        for cards in set.shuffled(){
            cards.setScale(0.1)
            cards.position = CGPoint(x: value * cardDistanceX , y: value2 * cardDistanceY)
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
        }else{
            set[0].removeFromParent()
            set[1].removeFromParent()
            matches += 1
        }
        if(matches > 5){
            endGame()
        }
            cardTouched = false
    }
    
    func endGame(){
            let gameScene = EndScene(size: size)
            gameScene.scaleMode = scaleMode
            gameScene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            view?.presentScene(gameScene)
    }
    
    func flipCard(id: Int){
        
    }
}
