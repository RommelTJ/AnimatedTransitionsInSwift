//
//  ThirdMenuViewController.swift
//  AnimatedTransitionsInSwift
//
//  Created by Rommel Rico on 3/2/16.
//  Copyright © 2016 Rommel Rico. All rights reserved.
//

import UIKit

class ThirdMenuViewController: UIViewController {
    //Properties
    let transitionManager = ThirdTransitionManager()
    @IBOutlet weak var textIcon: UIImageView!
    @IBOutlet weak var photoIcon: UIImageView!
    @IBOutlet weak var quoteIcon: UIImageView!
    @IBOutlet weak var linkIcon: UIImageView!
    @IBOutlet weak var chatIcon: UIImageView!
    @IBOutlet weak var audioIcon: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var photoLabel: UILabel!
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    @IBOutlet weak var chatLabel: UILabel!
    @IBOutlet weak var audioLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.transitioningDelegate = self.transitionManager
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
