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
        
        addHighlightOverlay(forHighlightedItems: [viewItem, cmView])
        
        presentedViewController.present(tooltipVC, animated: true)
    }
    
    public func dismissToolTip(animated : Bool) {
        tooltipVC.dismiss(animated: animated)
    }
    
    public func nibView<T: UIView>(customView: T.Type, named: String? = nil) -> T {
        return T.fromNib(named: named)
    }
    
    func addHighlightOverlay(forHighlightedItems items: [UIView]) {
        guard let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) else { return }

        // Create the overlay view with a semi-transparent background
        let overlayView = UIView(frame: window.bounds)
        overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        window.addSubview(overlayView)

        // Create a path for the overlay
        let overlayPath = UIBezierPath(rect: window.bounds)
        
        // Create paths for each item to be highlighted
        items.forEach { itemView in
            let itemFrame = itemView.convert(itemView.bounds, to: window)
            let itemPath = UIBezierPath(rect: itemFrame)
            overlayPath.append(itemPath.reversing())
        }

        // Create a shape layer to mask the overlay
        let maskLayer = CAShapeLayer()
        maskLayer.path = overlayPath.cgPath
        overlayView.layer.mask = maskLayer
    }

    
}
