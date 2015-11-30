//
//  APLBlendingSprites.swift
//  Sprite Tour
//
//  Translated by OOPer in cooperation with shlab.jp, on 2015/11/21.
//
//
/*
     File: APLBlendingSprites.h
     File: APLBlendingSprites.m
 Abstract:
 This scene shows how to use a blend mode other than the default blend mode.

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


// Useful random functions.
private func myRandf() -> CGFloat {
    return CGFloat(rand()) / CGFloat(RAND_MAX)
}

private func myRand(low: CGFloat, _ high: CGFloat) -> CGFloat {
    return myRandf() * (high - low) + low
}


@objc(APLBlendingSprites)
class APLBlendingSprites: APLCommonScene {
    
    override func createSceneContents() {
        self.addSceneDescriptionLabel()
        /*
        The scene is a node, so it can run actions. In this scene, it periodically creates
        a new light and adds it to itself.
        */
        self.runAction(self.newAddLightAction())
    }
    
    private func newAddLightAction() -> SKAction {
        // This sequence uses a custom method to add the light, then it waits for a random period of time.
        let sequence = SKAction.sequence([
            SKAction.performSelector("addLight", onTarget: self),
            SKAction.waitForDuration(0.50, withRange: 0.10)
            ])
        return SKAction.repeatActionForever(sequence)
    }
    
    @objc func addLight() {
        /*
        Create a new light and add it to the scene. The light uses an additive blend mode.
        */
        let sprite = SKSpriteNode(imageNamed: "spark.png")
        sprite.position = CGPointMake(myRand(-150,150)+CGRectGetMidX(self.frame),
            myRand(-150,150)+CGRectGetMidY(self.frame))
        sprite.blendMode = .Add
        
        // these values were chosen only for the aesthetic effect.
        sprite.alpha = 0.5
        sprite.setScale(2.0)
        
        self.addChild(sprite)
    }
    
    
    private func addSceneDescriptionLabel() {
        let myLabel = SKLabelNode(fontNamed: "Helvetica")
        myLabel.text = NSLocalizedString("These textured sprite nodes are combined using an additive blend.", comment: "")
        myLabel.fontSize = 18
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame), 100)
        self.addChild(myLabel)
    }
    
    
}