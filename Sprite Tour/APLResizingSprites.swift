//
//  APLResizingSprites.swift
//  Sprite Tour
//
//  Translated by OOPer in cooperation with shlab.jp, on 2015/11/22.
//
//
/*
     File: APLResizingSprites.h
     File: APLResizingSprites.m
 Abstract:
 This scene shows how to resize sprites. It shows how the centerRect property can be used to change how the texture
 is scaled and applied to the sprite.

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

@objc(APLResizingSprites)
class APLResizingSprites: APLCommonScene {
    
    
    override func createSceneContents() {
        self.addResizingSprites()
    }
    
    private func addResizingSprites() {
        /*
         Creates a pair of sprites. One uses the default scaling behavior, and the other uses
         a custom center rect. The corners of the UI button are a fixed size, and the remaining
         part of the texture is scaled.
         */
        let texture = SKTexture(imageNamed: "stretchable_image.png")
        let resizeSpritesAction = self.newResizeSpriteAction(texture)
        
        let defaultSprite = SKSpriteNode(texture: texture)
        defaultSprite.position = CGPoint(x: self.frame.midX-192, y: self.frame.midY)
        self.addChild(defaultSprite)
        defaultSprite.run(resizeSpritesAction)
        self.addDescription(NSLocalizedString("Resized with default stretching", comment: ""), to: defaultSprite)
        
        let customSprite = SKSpriteNode(texture: texture)
        customSprite.position = CGPoint(x: self.frame.midX+192,y: self.frame.midY)
        // the center rect calculation is always based on the artwork. In this case
        // the artwork is a 28 x 28 pixel image with a 4 x 4 pixel stretchable center.
        customSprite.centerRect = CGRect(x: 12.0/28.0,y: 12.0/28.0,width: 4.0/28.0,height: 4.0/28.0)
        self.addChild(customSprite)
        customSprite.run(resizeSpritesAction)
        self.addDescription(NSLocalizedString("Resized with custom stretching", comment: ""), to: customSprite)
    }
    
    
    private func newResizeSpriteAction(_ texture: SKTexture) -> SKAction {
        /*
         Creates and returns an action sequence that resizes a sprite through a variety of sizes.
         It then returns the sprite back to its normal default size.
         */
        if #available(macOS 10.12, *) {
            let sequence = SKAction.sequence([
                SKAction.wait(forDuration: 1.0),
                SKAction.scale(to: CGSize(width: 192, height: 192), duration: 1.0),
                SKAction.wait(forDuration: 1.0),
                SKAction.scale(to: CGSize(width: 128, height: 192), duration: 1.0),
                SKAction.wait(forDuration: 1.0),
                SKAction.scale(to: CGSize(width: 256, height: 128), duration: 1.0),
                SKAction.wait(forDuration: 1.0),
                SKAction.scale(to: CGSize(width: texture.size().width, height: texture.size().height), duration: 1.0)
                ])
            return SKAction.repeatForever(sequence)
        } else {
            let sequence = SKAction.sequence([
                SKAction.wait(forDuration: 1.0),
                //SKAction.resize(toWidth: 192, height: 192, duration: 1.0),
                SKAction.scaleX(to: 192/28.0, y: 192/28.0, duration: 1.0),
                SKAction.wait(forDuration: 1.0),
                //SKAction.resize(toWidth: 128, height: 192, duration: 1.0),
                SKAction.scaleX(to: 128/28.0, y: 192/28.0, duration: 1.0),
                SKAction.wait(forDuration: 1.0),
                //SKAction.resize(toWidth: 256, height: 128, duration: 1.0),
                SKAction.scaleX(to: 256/28.0, y: 128/28.0, duration: 1.0),
                SKAction.wait(forDuration: 1.0),
                //SKAction.resize(toWidth: texture.size().width, height: texture.size().height, duration: 1.0)
                SKAction.scaleX(to: 1.0, y: 1.0, duration: 1.0),
                ])
            return SKAction.repeatForever(sequence)
        }
    }
    
    private func addDescription(_ description: String, to sprite: SKSpriteNode) {
        let myLabel = SKLabelNode(fontNamed: "Helvetica")
        myLabel.text = description
        myLabel.fontSize = 18
        //myLabel.position = CGPoint(x: 0,y: -128)
        //sprite.addChild(myLabel)
        myLabel.position = CGPoint(x: sprite.position.x, y: sprite.position.y-128)
        self.addChild(myLabel)
    }
    
}
