//
//  ToolTipVC.swift
//  SwiftyToolTips
//
//  Created by Sparsh Singh on 21/03/24.
//

import UIKit

class ToolTipVC : UIViewController {
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public func showToolTip(onItem viewItem: UIView, cmView: UIView, arrowDirection: UIPopoverArrowDirection = .any, viewSize: CGSize =  CGSize(width: CGFloat(246), height: CGFloat(112))) {
        view.addSubViewWithAutolayoutSafeArea(subView: cmView)
        preferredContentSize = viewSize
        modalPresentationStyle = .popover
        let presentationController = self.presentationController as! UIPopoverPresentationController
        presentationController.backgroundColor = .clear
        presentationController.sourceView = viewItem
        presentationController.sourceRect = viewItem.bounds
        presentationController.permittedArrowDirections = arrowDirection
        view.backgroundColor = cmView.backgroundColor
        presentationController.delegate = self
    }
    
}

extension ToolTipVC: UIPopoverPresentationControllerDelegate {
    public func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}
