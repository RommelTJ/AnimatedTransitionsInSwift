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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //IBAction required to use an Exit Segue.
    @IBAction func unwindToViewController (sender: UIStoryboardSegue){
        //Code not necessary in our implementation.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // this gets a reference to the screen that we're about to transition to
        let toViewController = segue.destinationViewController as UIViewController
        
        //Instead of using the default transition animation, we'll ask the segue to 
        //use our custom TransitionManager object to manage the transition animation.
        toViewController.transitioningDelegate = self.transitionManager
    }

}

