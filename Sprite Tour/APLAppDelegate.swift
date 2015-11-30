//
//  APLAppDelegate.swift
//  Sprite Tour
//
//  Translated by OOPer in cooperation with shlab.jp, on 2015/11/22.
//
//
/*
     File: APLAppDelegate.h
     File: APLAppDelegate.m
 Abstract:
 This implements behaviors common to all of the scenes.

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

@NSApplicationMain
@objc(APLAppDelegate)
class APLAppDelegate: NSObject, NSApplicationDelegate {
    
    
    @IBOutlet private var window: NSWindow?
    @IBOutlet private weak var skView: SKView!
    @IBOutlet private weak var buttonMatrix: NSMatrix!
    
    
    func applicationDidFinishLaunching(notification: NSNotification) {
        self.skView.showsFPS = true
        self.skView.showsNodeCount = true
        self.skView.showsDrawCount = true
        
        let selectedIndex = self.buttonMatrix.selectedColumn
        self.presentSceneAtIndex(selectedIndex)
    }
    
    
    @IBAction func takeSceneIndexFrom(_: AnyObject) {
        let selectedIndex = self.buttonMatrix.selectedColumn
        self.presentSceneAtIndex(selectedIndex)
    }
    
    
    private func presentSceneAtIndex(index: Int) {
        /* Pick a size for the scene */
        let size = CGSizeMake(1024, 768)
        
        let scene: SKScene
        
        switch index {
        case 0:
            scene = APLBasicSprites(size: size)
            
        case 1:
            scene = APLColorizedSprites(size: size)
            
        case 2:
            scene = APLResizingSprites(size: size)
            
        case 3:
            scene = APLSpriteAnchors(size: size)
            
        case 4:
            scene = APLBlendingSprites(size: size)
            
        case 5:
            scene = APLAnimatingSprites(size: size)
            
        default:
            return
        }
        
        /* Set the scale mode to scale to fit the window */
        scene.scaleMode = .AspectFit
        self.skView.presentScene(scene)
        
    }
    
    
    func applicationShouldTerminateAfterLastWindowClosed(sender: NSApplication) -> Bool {
        return true
    }
    
}