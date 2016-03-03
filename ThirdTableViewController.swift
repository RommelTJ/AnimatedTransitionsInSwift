//
//  ThirdTableViewController.swift
//  AnimatedTransitionsInSwift
//
//  Created by Rommel Rico on 3/2/16.
//  Copyright © 2016 Rommel Rico. All rights reserved.
//

import UIKit

class ThirdTableViewController: UITableViewController {
    //Properties
    var transitionManager = ThirdTransitionManager()

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
        let menu = segue.destinationViewController as! ThirdMenuViewController
        menu.transitioningDelegate = self.transitionManager
    }
}
