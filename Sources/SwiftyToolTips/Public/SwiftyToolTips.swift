//
//  SwiftyToolTips.swift
//  SwiftyToolTips
//
//  Created by Sparsh Singh on 21/03/24.
//

import UIKit

public final class SwiftyToolTips : NSObject {
    
    public static let shared    = SwiftyToolTips()
    
    private let tooltipVC       = ToolTipVC()
    private var parentView      = UIView()
    
}

extension SwiftyToolTips {
    
    public func showToolTip(mainView parentView: UIView, onItem viewItem: UIView, cmView: UIView, arrowDirection: UIPopoverArrowDirection = .any, viewSize: CGSize? = nil) {
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let topViewController = windowScene.windows.first?.rootViewController else {
            fatalError("Unable to get the topmost view controller.")
        }
        
        self.parentView = parentView
        
        let size = CGSize(width: UIScreen.main.bounds.width - 40, height: CGFloat(112))
        tooltipVC.showToolTip(onItem: viewItem, cmView: cmView, arrowDirection: arrowDirection, viewSize: viewSize ?? size)
        
        var presentedViewController = topViewController
        while let presented = presentedViewController.presentedViewController {
            presentedViewController = presented
        }
        
        parentView.addDarkView { [weak self] in
            parentView.addSnapshot(of: viewItem)
            guard let toolTipVC = self?.tooltipVC else { return }
            presentedViewController.present(toolTipVC, animated: true)
        }
    }
    
    public func dismissToolTip(animated : Bool, completion: (() -> Void)? = nil) {
        parentView.removeSnapshots()
        parentView.removeDarkView()
        tooltipVC.dismiss(animated: animated) {
            completion?()
        }
    }
    
    public func nibView<T: UIView>(customView: T.Type, named: String? = nil) -> T {
        return T.fromNib(named: named)
    }

    
}
