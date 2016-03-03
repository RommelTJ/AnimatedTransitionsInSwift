//
//  SecondTransitionManager.swift
//  AnimatedTransitionsInSwift
//
//  Created by Rommel Rico on 3/1/16.
//  Copyright © 2016 Rommel Rico. All rights reserved.
//

import UIKit

class SecondTransitionManager: NSObject {
    //Properties
    var isPresenting = true
}

// MARK: UIViewControllerAnimatedTransitioning protocol methods
extension SecondTransitionManager: UIViewControllerAnimatedTransitioning {
    
    //Animate a change from one ViewController to another.
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        //Get reference to our fromView, toView and the container view that we should perform the transition in.
        let container = transitionContext.containerView()
        
        //Create a tuple of views.
        let screens: (fromView: UIViewController, toView: UIViewController) =
            (transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!,
            transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!)
        
        //Assign references to our MenuViewController and the 'bottom' view controller from the tuple.
        //The MenuViewController will alternate between the fromView and toView depending if we're presenting or dismissing.
        let menuViewController = !self.isPresenting ? screens.fromView as! MenuViewController : screens.toView as! MenuViewController
        let bottomViewController = !self.isPresenting ? screens.toView as UIViewController : screens.fromView as UIViewController
        
        let menuView = menuViewController.view
        let bottomView = bottomViewController.view
        
        //Prepare menu items to slide in.
        if (self.isPresenting){
            self.offStageMenuController(menuViewController)
        }
        
        //Add both views to our container View.
        container!.addSubview(bottomView)
        container!.addSubview(menuView)
        
        let duration = self.transitionDuration(transitionContext)
        
        //Perform the animation.
        UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.8, options: [], animations: {
            
            if (self.isPresenting){
                self.onStageMenuController(menuViewController) // onstage items: slide in
            }
            else {
                self.offStageMenuController(menuViewController) // offstage items: slide out
            }
            
            }, completion: { finished in
                //Tell our transitionContext object that we've finished animating
                transitionContext.completeTransition(true)
                
                //We have to manually add our 'toView' back.
                UIApplication.sharedApplication().keyWindow!.addSubview(screens.toView.view)
        })
    }
    
    // return how many seconds the transiton animation will take
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func offStage(amount: CGFloat) -> CGAffineTransform {
        return CGAffineTransformMakeTranslation(amount, 0)
    }
    
    func offStageMenuController(menuViewController: MenuViewController){
        //Prepare menu to fade out.
        menuViewController.view.alpha = 0
        
        //Setup paramaters for 2D transitions for animations.
        let topRowOffset: CGFloat = 300
        let middleRowOffset: CGFloat = 150
        let bottomRowOffset: CGFloat = 50
        
        menuViewController.textIcon.transform = self.offStage(-topRowOffset)
        menuViewController.textLabel.transform = self.offStage(-topRowOffset)
        
        menuViewController.photoIcon.transform = self.offStage(topRowOffset)
        menuViewController.photoLabel.transform = self.offStage(topRowOffset)
        
        menuViewController.quoteIcon.transform = self.offStage(-middleRowOffset)
        menuViewController.quoteLabel.transform = self.offStage(-middleRowOffset)
        
        menuViewController.linkIcon.transform = self.offStage(middleRowOffset)
        menuViewController.linkLabel.transform = self.offStage(middleRowOffset)
        
        menuViewController.chatIcon.transform = self.offStage(-bottomRowOffset)
        menuViewController.chatLabel.transform = self.offStage(-bottomRowOffset)
        
        menuViewController.audioIcon.transform = self.offStage(bottomRowOffset)
        menuViewController.audioLabel.transform = self.offStage(bottomRowOffset)

    }
    
    func onStageMenuController(menuViewController: MenuViewController){
        //Prepare menu to fade in.
        menuViewController.view.alpha = 1
        
        menuViewController.textIcon.transform = CGAffineTransformIdentity
        menuViewController.textLabel.transform = CGAffineTransformIdentity
        
        menuViewController.photoIcon.transform = CGAffineTransformIdentity
        menuViewController.photoLabel.transform = CGAffineTransformIdentity
        
        menuViewController.quoteIcon.transform = CGAffineTransformIdentity
        menuViewController.quoteLabel.transform = CGAffineTransformIdentity
        
        menuViewController.linkIcon.transform = CGAffineTransformIdentity
        menuViewController.linkLabel.transform = CGAffineTransformIdentity
        
        menuViewController.chatIcon.transform = CGAffineTransformIdentity
        menuViewController.chatLabel.transform = CGAffineTransformIdentity
        
        menuViewController.audioIcon.transform = CGAffineTransformIdentity
        menuViewController.audioLabel.transform = CGAffineTransformIdentity
    }
    
}

// MARK: UIViewControllerTransitioningDelegate protocol methods
extension SecondTransitionManager: UIViewControllerTransitioningDelegate {
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = false
        return self
    }
}