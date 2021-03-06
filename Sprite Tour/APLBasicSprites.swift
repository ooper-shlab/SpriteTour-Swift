//
//  APLBasicSprites.swift
//  Sprite Tour
//
//  Translated by OOPer in cooperation with shlab.jp, on 2015/11/21.
//
//
/*
     File: APLBasicSprites.h
     File: APLBasicSprites.m
 Abstract:
 This scene shows how to create simple sprites.

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

@objc(APLBasicSprites)
class APLBasicSprites: APLCommonScene {
    
    
    override func createSceneContents() {
        self.backgroundColor = SKColor.black
        self.scaleMode = .aspectFit
        
        self.addTexturedSprite()
        self.addColoredSprite()
    }
    
    private func addTexturedSprite() {
        /*
        Creates a textured sprite and adds it to the scene. A label is added as a child of the sprite; if the sprite moves, the label moves with it.
        */
        let sprite = SKSpriteNode(imageNamed: "rocket.png")
        
        sprite.position = CGPoint(x: self.frame.midX-200,
            y: self.frame.midY)
        self.addChild(sprite)
        
        self.addDescription(NSLocalizedString("Texture Sprite", comment: ""), toSprite: sprite)
    }
    
    
    private func addColoredSprite() {
        /*
        Creates a colored sprite and adds it to the scene. A label is added as a child of the sprite; if the sprite moves, the label moves with it.
        */
        let sprite = SKSpriteNode(color: .red, size: CGSize(width: 128,height: 128))
        
        sprite.position = CGPoint(x: self.frame.midX+200,
            y: self.frame.midY)
        self.addChild(sprite)
        
        self.addDescription(NSLocalizedString("Color Sprite", comment: ""), toSprite: sprite)
    }
    
    private func addDescription(_ description: String, toSprite sprite: SKSpriteNode) {
        let myLabel = SKLabelNode(fontNamed: "Helvetica")
        myLabel.text = description
        myLabel.fontSize = 18
        myLabel.position = CGPoint(x: 0,y: -sprite.size.height/2 - 30)
        sprite.addChild(myLabel)
    }
    
    
}
