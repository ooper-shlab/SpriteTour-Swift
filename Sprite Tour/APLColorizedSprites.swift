//
//  APLColorizedSprites.swift
//  Sprite Tour
//
//  Translated by OOPer in cooperation with shlab.jp, on 2015/11/22.
//
//
/*
     File: APLColorizedSprites.h
     File: APLColorizedSprites.m
 Abstract:
 This scene shows how to apply colors to a textured sprite.

  Version: 1.0

 Disclaimer: IMPORTANT:  This Apple software is supplied to you by Apple
 Inc. ("Apple") in consideration of your agreement to the following
 terms, and your use, installation, modification or redistribution of
 this Apple software constitutes acceptance of these terms.  If you do
 not agree with these terms, please do not use, install, modify or
 redistribute this Apple software.

 In consideration of your agreement to abide by the following terms, and
 subject to these terms, Apple grants you a personal, non-exclusive
 license, under Apple's copyrights in this original Apple software (the
 "Apple Software"), to use, reproduce, modify and redistribute the Apple
 Software, with or without modifications, in source and/or binary forms;
 provided that if you redistribute the Apple Software in its entirety and
 without modifications, you must retain this notice and the following
 text and disclaimers in all such redistributions of the Apple Software.
 Neither the name, trademarks, service marks or logos of Apple Inc. may
 be used to endorse or promote products derived from the Apple Software
 without specific prior written permission from Apple.  Except as
 expressly stated in this notice, no other rights or licenses, express or
 implied, are granted by Apple herein, including but not limited to any
 patent rights that may be infringed by your derivative works or by other
 works in which the Apple Software may be incorporated.

 The Apple Software is provided by Apple on an "AS IS" basis.  APPLE
 MAKES NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION
 THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS
 FOR A PARTICULAR PURPOSE, REGARDING THE APPLE SOFTWARE OR ITS USE AND
 OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS.

 IN NO EVENT SHALL APPLE BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL
 OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION,
 MODIFICATION AND/OR DISTRIBUTION OF THE APPLE SOFTWARE, HOWEVER CAUSED
 AND WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING NEGLIGENCE),
 STRICT LIABILITY OR OTHERWISE, EVEN IF APPLE HAS BEEN ADVISED OF THE
 POSSIBILITY OF SUCH DAMAGE.

 Copyright (C) 2013 Apple Inc. All Rights Reserved.

 */

import SpriteKit

@objc(APLColorizedSprites)
class APLColorizedSprites: APLCommonScene {
    
    private var spriteTemplate: SKSpriteNode!
    
    
    override func createSceneContents() {
        self.backgroundColor = SKColor.blackColor()
        self.scaleMode = .AspectFit
        
        // Allocate a single sprite and copy it to make the other sprites.
        let sprite = SKSpriteNode(imageNamed: "rocket.png")
        sprite.setScale(0.5)
        self.spriteTemplate = sprite
        
        self.addBlendFactorLabels()
        
        // Add rows of sprites for a different colors.
        self.addColorRow(SKColor.redColor(), forRow: 0)
        self.addColorRow(SKColor.greenColor(), forRow: 1)
        self.addColorRow(SKColor.blueColor(), forRow: 2)
        self.addColorRow(SKColor.yellowColor(), forRow: 3)
        
        self.addAnimatedSprite()
    }
    
    
    private func addBlendFactorLabels() {
        /*
        Adds a series of labels to the scene to identify how much color is being added to each sprite.
        (The labels are aligned with the color rows).
        */
        let descriptionLabel = SKLabelNode(fontNamed: "Helvetica")
        descriptionLabel.fontSize = 18
        descriptionLabel.text = NSLocalizedString("Color blend factor:", comment: "")
        descriptionLabel.horizontalAlignmentMode = .Left
        descriptionLabel.position = CGPointMake(80,
            CGRectGetMaxY(self.frame)-70)
        self.addChild(descriptionLabel)
        
        for i in 0...10 {
            let numberLabel = SKLabelNode(fontNamed: "Helvetica")
            numberLabel.text = String(format: "%4.2f", Double(i)/10.0)
            numberLabel.fontSize = 18
            numberLabel.position = CGPointMake(100 + CGFloat(i) * (self.spriteTemplate.size.width + 10),
                CGRectGetMaxY(self.frame)-90)
            
            self.addChild(numberLabel)
        }
    }
    
    
    private func addColorRow(color: SKColor, forRow row: Int) {
        /*
        Adds a row of sprites to the scene, showing how a sprite is affected by the blended color.
        */
        for i in 0...10 {
            let s = self.spriteTemplate.copy() as! SKSpriteNode
            s.color = color
            s.colorBlendFactor = 0.1 * CGFloat(i)
            s.position = CGPointMake(100 + CGFloat(i) * (self.spriteTemplate.size.width + 10),
                100 + CGFloat(row) * (self.spriteTemplate.size.height + 10)
            )
            
            self.addChild(s)
        }
        
        // And a simple color node to show the actual blend color.
        let colorSwash = SKSpriteNode(color: color, size: CGSizeMake(64,64))
        colorSwash.position = CGPointMake(100 + 12 * (self.spriteTemplate.size.width + 10),
            100 + CGFloat(row) * (self.spriteTemplate.size.height + 10)
        )
        
        self.addChild(colorSwash)
    }
    
    
    private func addAnimatedSprite() {
        /*
        Adds a sprite to the scene, and animates its blend color.
        */
        let animatedSprite = self.spriteTemplate.copy() as! SKSpriteNode
        animatedSprite.position = CGPointMake(925,384)
        self.addChild(animatedSprite)
        
        animatedSprite.runAction(self.newAnimateColorsAction())
        
        // Label the sprite.
        // Normally, this would be attached to the sprite. But in this scene, the sprite is scaled
        // to 50%, so the label would be too. So instead, the sprite's position is calculated in the
        // scene and placed there.
        let myLabel = SKLabelNode(fontNamed: "Helvetica")
        myLabel.text = NSLocalizedString("Animated Color Blending", comment: "")
        myLabel.fontSize = 14
        myLabel.position = CGPointMake(animatedSprite.position.x, animatedSprite.position.y - 90)
        self.addChild(myLabel)
    }
    
    
    private func newAnimateColorsAction() -> SKAction {
        /*
        Creates and returns an action sequence that animates a sprite's blend color.
        */
        let  sequence = SKAction.sequence([
            SKAction.waitForDuration(1.0),
            SKAction.colorizeWithColor(SKColor.redColor(), colorBlendFactor: 1.0, duration: 1.0),
            SKAction.waitForDuration(1.0),
            SKAction.colorizeWithColor(SKColor.greenColor(), colorBlendFactor: 1.0, duration: 1.0),
            SKAction.waitForDuration(1.0),
            SKAction.colorizeWithColor(SKColor.blueColor(), colorBlendFactor: 1.0, duration: 1.0),
            SKAction.waitForDuration(1.0),
            SKAction.colorizeWithColor(SKColor.yellowColor(), colorBlendFactor: 1.0, duration: 1.0),
            SKAction.waitForDuration(1.0),
            SKAction.colorizeWithColorBlendFactor(0.0, duration: 1.0)
            ])
        
        return SKAction.repeatActionForever(sequence)
    }
    
}