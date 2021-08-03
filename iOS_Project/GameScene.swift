//
//  GameScene.swift
//  iOS_Project
//
//  Created by Sergiusz Pietrala on 12/07/2021.
//  Copyright © 2021 Sergiusz Pietrala. All rights reserved.
//

import SpriteKit

class GameScene: SKScene{
    
    var cardNames: [String] = []
    var cardTouched = false
    var toCheck: [Card] = []
    var matches = 0
    var type = 0
    var moves = 0
    
    override func didMove(to view: SKView){
        self.view!.isUserInteractionEnabled = false
        backgroundColor = SKColor.white
        
        var set: Set<Card> = []
        
        let cardDistanceX = 250
        let cardDistanceY = 400
        var value = -1
        var value2 = 0
        
        loadFile(type: type)
        
        // Creating cards and putting them into set
        for i in 0...11{
            let card = Card(imageNamed: "CardBack")
            card.id = i
            set.insert(card)
        }
        
        var i = 0.2
        // Shuffling and positioning cards
        for cards in set.shuffled(){
            DispatchQueue.main.asyncAfter(deadline: .now() + i){
                self.flipCard(node: cards)
            }
            i += 0.2
            cards.setScale(1)
            cards.position = CGPoint(x: value * cardDistanceX , y: value2 * cardDistanceY)
            value += 1
            if(value > 1){
                value = -1
                value2 += 1
            }
            addChild(cards)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 4){
                self.flipBack(node: cards)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        if let touch = touches.first{
            let location = touch.previousLocation(in: self)
            let node = self.nodes(at: location).first as? Card
            
            if node?.pressed == false{
                self.view!.isUserInteractionEnabled = false
                flipCard(node: node!)
                node!.pressed = true
                toCheck.append(node!)
                if(cardTouched){
                    checkMatch(set: toCheck)
                    toCheck.removeAll()
                }else{
                    cardTouched = true
                    self.view!.isUserInteractionEnabled = true
                }
            }
        }
    }
    
    func checkMatch(set: [Card]){
        moves += 1
        // Checking if cards match
        // If not flip back
        if(set[0].id == set[1].id || set[0].id + 6 == set[1].id ||  set[0].id == set[1].id + 6){
            // If they do, get rid of them after delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                set[0].removeFromParent()
                set[1].removeFromParent()
                self.view!.isUserInteractionEnabled = true
            }
            matches += 1
        }else{
            flipBack(node: set[0])
            flipBack(node: set[1])
            set[0].pressed = false
            set[1].pressed = false
        }
        // If no cards displayed, end game
        if(matches > 5){
            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                self.endGame()
            }
        }
        cardTouched = false
    }
    
    // Changing scene to the end game
    func endGame(){
        let endScene = EndScene(size: size)
        endScene.scaleMode = scaleMode
        endScene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        endScene.moves = moves
        view?.presentScene(endScene)
    }
    
    func flipCard(node: Card){
        let flip = SKAction.scaleX(to: 0, duration: 0.3)
        let flip2 = SKAction.scaleX(to: -1, duration: 0.3)
        
        let changeColor = SKAction.run({
            node.texture = SKTexture(imageNamed: String(node.id))
        })
        let action = SKAction.sequence([flip, changeColor, flip2])
        node.run(action)
    }
    
    func flipBack(node: Card){
        let flip = SKAction.scaleX(to: 0, duration: 0.3)
        let flip2 = SKAction.scaleX(to: 1, duration: 0.3)
        let changeColor = SKAction.run({
            node.texture = SKTexture(imageNamed: "CardBack")
        })
        let action = SKAction.sequence([flip, changeColor, flip2])
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.9){
            node.run(action)
            self.view!.isUserInteractionEnabled = true
            
        }
    }
    
    func loadFile(type: Int){
        let filename = String(type)
        let urlPath = Bundle.main.url(forResource: filename, withExtension: "txt")
        if let path = urlPath {
           if let dataFromFile = try? String(contentsOf: path) {
               let lines = dataFromFile.split(separator:"\n")
               for i in 0...11{
                 print(lines[i])
               }
               }
            }
        }
        }
