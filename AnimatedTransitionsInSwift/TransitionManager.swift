//
//  TransitionManager.swift
//  AnimatedTransitionsInSwift
//
//  Created by Rommel Rico on 3/1/16.
//  Copyright © 2016 Rommel Rico. All rights reserved.
//

import UIKit

class TransitionManager: NSObject {
    //Properties
    var isPresenting = true
}

// MARK: UIViewControllerAnimatedTransitioning protocol methods
extension TransitionManager: UIViewControllerAnimatedTransitioning {
    
    //Animate a change from one ViewController to another.
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {

        //Get reference to our fromView, toView and the container view that we should perform the transition in.
        let container = transitionContext.containerView()
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        
        //Set up from 2D transforms that we'll use in the animation.
        let π : CGFloat = 3.14159265359
        
        let offScreenRotateIn = CGAffineTransformMakeRotation(-π/2)
        let offScreenRotateOut = CGAffineTransformMakeRotation(π/2)
        
        //Start the toView to the right of the screen.
        if isPresenting {
            toView.transform = offScreenRotateIn
        } else {
            toView.transform = offScreenRotateOut
        }
        
        //Set the anchor point so that rotations happen from the top-left corner
        toView.layer.anchorPoint = CGPoint(x:0, y:0)
        fromView.layer.anchorPoint = CGPoint(x:0, y:0)
        
        //Updating the anchor point also moves the position to we have to move the center position to the top-left to compensate
        toView.layer.position = CGPoint(x:0, y:0)
        fromView.layer.position = CGPoint(x:0, y:0)
        
        //Add both views to our view controller.
        container!.addSubview(toView)
        container!.addSubview(fromView)
        
        //Get the duration of the animation.
        //DON'T just type '0.5s'.
        let duration = self.transitionDuration(transitionContext)
        
        //Perform the animation.
        //For this example, just slid both fromView and toView to the left at the same time meaning fromView is
        //pushed off the screen and toView slides into view we also use the block animation usingSpringWithDamping
        //for a little bounce.
        UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, options: UIViewAnimationOptions.TransitionFlipFromRight, animations: {
            
            if self.isPresenting {
                fromView.transform = offScreenRotateIn
            } else {
                fromView.transform = offScreenRotateOut
            }
            toView.transform = CGAffineTransformIdentity
            
            }, completion: { finished in
                // tell our transitionContext object that we've finished animating
                transitionContext.completeTransition(true)
                
        })
    }
    
    // return how many seconds the transiton animation will take
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
}

// MARK: UIViewControllerTransitioningDelegate protocol methods
extension TransitionManager: UIViewControllerTransitioningDelegate {
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = false
        return self
    }
}