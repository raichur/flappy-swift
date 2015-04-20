//
//  GameScene.swift
//  Flappy Swift
//
//  Created by Joshua Raichur on 4/19/15.
//  Copyright (c) 2015 Joshua Raichur. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var bird = SKSpriteNode()
    var bg = SKSpriteNode()
    
    override func didMoveToView(view: SKView) {
        
        var birdTexture = SKTexture(imageNamed: "flappy1.png")
        var birdTexture2 = SKTexture(imageNamed: "flappy2.png")
        var backgroundTexture = SKTexture(imageNamed: "bg.png")
        var animation = SKAction.animateWithTextures([birdTexture, birdTexture2], timePerFrame: 0.1)
        var makeBirdFlap = SKAction.repeatActionForever(animation)
        
        var moveBg = SKAction.moveByX(-backgroundTexture.size().width, y: 0, duration: 9)
        var replaceBg = SKAction.moveByX(backgroundTexture.size().width, y: 0, duration: 0)
        var moveBgForever = SKAction.repeatActionForever(SKAction.sequence([moveBg, replaceBg]))
        
        for (var i:CGFloat = 0; i < 3; i++) {
            bg = SKSpriteNode(texture: backgroundTexture)
            bg.position = CGPoint(x: (backgroundTexture.size().width/2) + (backgroundTexture.size().width*i), y: CGRectGetMidY(self.frame))
            bg.size.height = self.frame.height
            bg.runAction(moveBgForever)
            self.addChild(bg)
        }
        
        bird = SKSpriteNode(texture: birdTexture)
        bird.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        bird.runAction(makeBirdFlap)
        
        self.addChild(bird)
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
