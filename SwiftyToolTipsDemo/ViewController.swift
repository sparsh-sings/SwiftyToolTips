//
//  ViewController.swift
//  SwiftyToolTipsDemo
//
//  Created by Sparsh Singh on 21/03/24.
//

import UIKit
import SwiftyToolTips

class ViewController: UIViewController {
    
    @IBOutlet weak var mainButton: UIButton!
    
    let customeView = SwiftyToolTips.shared.nibView(customView: TempView.self)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        customeView.btnClose.addTarget(self, action: #selector(dismissPop), for: .touchUpInside)
        customeView.lblTitle.text = "Lorem Ipsum is simply"
        customeView.lblDescription.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        SwiftyToolTips.shared.showToolTip(onItem: mainButton, cmView: customeView, arrowDirection: .up)
    }
    
    @objc func dismissPop() {
        SwiftyToolTips.shared.dismissToolTip(animated: true)
    }

}

