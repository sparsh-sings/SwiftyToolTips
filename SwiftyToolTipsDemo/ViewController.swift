//
//  ViewController.swift
//  SwiftyToolTipsDemo
//
//  Created by Sparsh Singh on 21/03/24.
//

import UIKit
import SwiftyToolTips

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let object = SwiftyToolTips.shared.printSomething()
        print(object)
    }


}

