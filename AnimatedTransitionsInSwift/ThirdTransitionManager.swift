//
//  ThirdTransitionManager.swift
//  AnimatedTransitionsInSwift
//
//  Created by Rommel Rico on 3/1/16.
//  Copyright © 2016 Rommel Rico. All rights reserved.
//

import UIKit

class ThirdTransitionManager: UIPercentDrivenInteractiveTransition {
    //Properties
    private var isPresenting = true
    private var isInteractive = false
}

// MARK: UIViewControllerAnimatedTransitioning protocol methods
extension ThirdTransitionManager: UIViewControllerAnimatedTransitioning {
    
    //Animate a change from one ViewController to another.
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        //Get reference to our fromView, toView and the container view that we should perform the transition in.
        let container = transitionContext.containerView()
        
        //Create a tuple of views.
        let screens: (fromView: UIViewController, toView: UIViewController) =
        (transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!,
            transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!)
        
        //Assign references to our ThirdMenuViewController and the 'bottom' view controller from the tuple.
        //The ThirdMenuViewController will alternate between the fromView and toView depending if we're presenting or dismissing.
        let thirdMenuViewController = !self.isPresenting ? screens.fromView as! ThirdMenuViewController : screens.toView as! ThirdMenuViewController
        let bottomViewController = !self.isPresenting ? screens.toView as UIViewController : screens.fromView as UIViewController
        
        let menuView = thirdMenuViewController.view
        let bottomView = bottomViewController.view
        
        //Prepare menu items to slide in.
        if (self.isPresenting){
            self.offStageMenuController(thirdMenuViewController)
        }
        
        //Add both views to our container View.
        container!.addSubview(bottomView)
        container!.addSubview(menuView)
        
        let duration = self.transitionDuration(transitionContext)
        
        //Perform the animation.
        UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.8, options: [], animations: {
            
            if (self.isPresenting){
                self.onStageMenuController(thirdMenuViewController) // onstage items: slide in
            }
            else {
                self.offStageMenuController(thirdMenuViewController) // offstage items: slide out
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
    
    func offStageMenuController(thirdMenuViewController: ThirdMenuViewController){
        //Prepare menu to fade out.
        thirdMenuViewController.view.alpha = 0
        
        //Setup paramaters for 2D transitions for animations.
        let topRowOffset: CGFloat = 300
        let middleRowOffset: CGFloat = 150
        let bottomRowOffset: CGFloat = 50
        
        thirdMenuViewController.textIcon.transform = self.offStage(-topRowOffset)
        thirdMenuViewController.textLabel.transform = self.offStage(-topRowOffset)
        
        thirdMenuViewController.photoIcon.transform = self.offStage(topRowOffset)
        thirdMenuViewController.photoLabel.transform = self.offStage(topRowOffset)
        
        thirdMenuViewController.quoteIcon.transform = self.offStage(-middleRowOffset)
        thirdMenuViewController.quoteLabel.transform = self.offStage(-middleRowOffset)
        
        thirdMenuViewController.linkIcon.transform = self.offStage(middleRowOffset)
        thirdMenuViewController.linkLabel.transform = self.offStage(middleRowOffset)
        
        thirdMenuViewController.chatIcon.transform = self.offStage(-bottomRowOffset)
        thirdMenuViewController.chatLabel.transform = self.offStage(-bottomRowOffset)
        
        thirdMenuViewController.audioIcon.transform = self.offStage(bottomRowOffset)
        thirdMenuViewController.audioLabel.transform = self.offStage(bottomRowOffset)
        
    }
    
    func onStageMenuController(thirdMenuViewController: ThirdMenuViewController){
        //Prepare menu to fade in.
        thirdMenuViewController.view.alpha = 1
        
        thirdMenuViewController.textIcon.transform = CGAffineTransformIdentity
        thirdMenuViewController.textLabel.transform = CGAffineTransformIdentity
        
        thirdMenuViewController.photoIcon.transform = CGAffineTransformIdentity
        thirdMenuViewController.photoLabel.transform = CGAffineTransformIdentity
        
        thirdMenuViewController.quoteIcon.transform = CGAffineTransformIdentity
        thirdMenuViewController.quoteLabel.transform = CGAffineTransformIdentity
        
        thirdMenuViewController.linkIcon.transform = CGAffineTransformIdentity
        thirdMenuViewController.linkLabel.transform = CGAffineTransformIdentity
        
        thirdMenuViewController.chatIcon.transform = CGAffineTransformIdentity
        thirdMenuViewController.chatLabel.transform = CGAffineTransformIdentity
        
        thirdMenuViewController.audioIcon.transform = CGAffineTransformIdentity
        thirdMenuViewController.audioLabel.transform = CGAffineTransformIdentity
    }
    
}

// MARK: UIViewControllerTransitioningDelegate protocol methods
extension ThirdTransitionManager: UIViewControllerTransitioningDelegate {
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = false
        return self
    }
    
    func interactionControllerForPresentation(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        if isInteractive {
            return self
        } else {
            return nil
        }
    }
    
    func interactionControllerForDismissal(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        if isInteractive {
            return self
        } else {
            return nil
        }
    }
    
    
}

//MARK: UIViewControllerInteractiveTransitioning protocol methods
extension ThirdMenuViewController: UIViewControllerInteractiveTransitioning {
    func startInteractiveTransition(transitionContext: UIViewControllerContextTransitioning) {
        //TODO
    }
}