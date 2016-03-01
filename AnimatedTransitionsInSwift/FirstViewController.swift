//
//  FirstViewController.swift
//  AnimatedTransitionsInSwift
//
//  Created by Rommel Rico on 3/1/16.
//  Copyright © 2016 Rommel Rico. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

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

}

