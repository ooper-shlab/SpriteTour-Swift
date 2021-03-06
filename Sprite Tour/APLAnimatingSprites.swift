//
//  APLAnimatingSprites.swift
//  Sprite Tour
//
//  Translated by OOPer in cooperation with shlab.jp, on 2015/11/21.
//
//
/*
     File: APLAnimatingSprites.h
     File: APLAnimatingSprites.m
 Abstract:
 This scene shows how to animate a sprite through a series of textures.

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

private let kDefaultNumberOfWalkFrames = 28
private let showCharacterFramesOverOneSecond = 1.0 / TimeInterval(kDefaultNumberOfWalkFrames)

@objc(APLAnimatingSprites)
class APLAnimatingSprites: APLCommonScene {
    
    private var walkFrames: [SKTexture] = []
    
    
    override func createSceneContents() {
        self.walkFrames = self.animationFramesForImageNamePrefix("warrior_walk_", frameCount: kDefaultNumberOfWalkFrames)
        
        // Create the sprite with the initial frame.
        let sprite = SKSpriteNode(texture: self.walkFrames[0])
        sprite.position = CGPoint(x: self.frame.midX,
            y: self.frame.midY)
        self.addChild(sprite)
        
        // Cycle through the frames.
        let animateFramesAction = SKAction.animate(with: self.walkFrames,
            timePerFrame: showCharacterFramesOverOneSecond,
            resize: true,
            restore: false)
        sprite.run(SKAction.repeatForever(animateFramesAction))
        
        self.addSceneDescriptionLabel()
    }
    
    
    private func animationFramesForImageNamePrefix(_ baseImageName: String, frameCount count: Int) -> [SKTexture] {
        /* Loads a series of frames from files stored in the app bundle, returning them in an array. */
        var array: [SKTexture] = []
        for i in 1...count {
            let imageName = String(format: "%@%04d.png", baseImageName, Int32(i))
            let t = SKTexture(imageNamed: imageName)
            array.append(t)
        }
        return array
    }
    
    
    private func addSceneDescriptionLabel() {
        /*
        Add a simple label that describes the scene.
        */
        let myLabel = SKLabelNode(fontNamed: "Helvetica")
        myLabel.text = NSLocalizedString("This sprite is animating through a series of texture images.", comment: "")
        myLabel.fontSize = 18
        myLabel.position = CGPoint(x: self.frame.midX, y: 100)
        self.addChild(myLabel)
    }
    
    
}
