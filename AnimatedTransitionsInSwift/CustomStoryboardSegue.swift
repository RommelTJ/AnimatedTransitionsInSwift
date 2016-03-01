//
//  CustomStoryboardSegue.swift
//  AnimatedTransitionsInSwift
//
//  Created by Rommel Rico on 3/1/16.
//  Copyright © 2016 Rommel Rico. All rights reserved.
//

import UIKit

class CustomStoryboardSegue: UIStoryboardSegue {
    override func perform() {
        let src = self.sourceViewController.view as UIView
        let dst = self.destinationViewController.view as UIView
        
        // Get the screen width and height.
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        let screenHeight = UIScreen.mainScreen().bounds.size.height
        
        // Specify the initial position of the destination view.
        dst.frame = CGRectMake(0.0, screenHeight, screenWidth, screenHeight)
        
        
        // Access the app's key window and insert the destination view above the current (source) one.
        let window = UIApplication.sharedApplication().keyWindow
        window?.insertSubview(dst, aboveSubview: src)
        
        // Animate the transition.
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            src.frame = CGRectOffset(src.frame, 0.0, -screenHeight)
            dst.frame = CGRectOffset(dst.frame, 0.0, -screenHeight)
            
            }) { (Finished) -> Void in
                self.sourceViewController.presentViewController(self.destinationViewController as UIViewController,
                    animated: false,
                    completion: nil)
        }
    }
}
