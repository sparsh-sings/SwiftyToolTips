//
//  SwiftyToolTips.swift
//  SwiftyToolTips
//
//  Created by Sparsh Singh on 21/03/24.
//

import UIKit

public final class SwiftyToolTips : NSObject {
    
    public static let shared = SwiftyToolTips()
    
    private let tooltipVC = ToolTipVC()
    
}

extension SwiftyToolTips {
    
    public func showToolTip(onItem viewItem: UIView, cmView: UIView, arrowDirection: UIPopoverArrowDirection = .any, viewSize: CGSize? = nil) {
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let topViewController = windowScene.windows.first?.rootViewController else {
            fatalError("Unable to get the topmost view controller.")
        }
        
        let size = CGSize(width: CGFloat(246), height: CGFloat(112))
        tooltipVC.showToolTip(onItem: viewItem, cmView: cmView, arrowDirection: arrowDirection, viewSize: viewSize ?? size)
        
        var presentedViewController = topViewController
        while let presented = presentedViewController.presentedViewController {
            presentedViewController = presented
        }
        
        presentedViewController.present(tooltipVC, animated: true)
    }
    
    public func dismissToolTip(animated : Bool) {
        tooltipVC.dismiss(animated: animated)
    }
    
    public func nibView<T: UIView>(customView: T.Type, named: String? = nil) -> T {
        return T.fromNib(named: named)
    }
    
}
