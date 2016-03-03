//
//  FirstViewController.swift
//  AnimatedTransitionsInSwift
//
//  Created by Rommel Rico on 3/1/16.
//  Copyright © 2016 Rommel Rico. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    //Properties
    let transitionManager = TransitionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        //Update the Status Bar style to black
        UIApplication.sharedApplication().statusBarStyle = .Default
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //IBAction required to use an Exit Segue.
    @IBAction func unwindToViewController (sender: UIStoryboardSegue){
        //Code not necessary in our implementation.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "firstCustomSegue" {
            //This gets a reference to the screen that we're about to transition to.
            let toViewController = segue.destinationViewController as UIViewController
            
            //Instead of using the default transition animation, we'll ask the segue to
            //use our custom TransitionManager object to manage the transition animation.
            toViewController.transitioningDelegate = self.transitionManager
            
            //Update the Status Bar style to white
            UIApplication.sharedApplication().statusBarStyle = .LightContent
        }
    }

}

