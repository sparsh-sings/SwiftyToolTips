//
//  SwiftyToolTips.swift
//  SwiftyToolTips
//
//  Created by Sparsh Singh on 21/03/24.
//


public final class SwiftyToolTips : NSObject {
    
    public static let shared = SwiftyToolTips()
    
}

extension SwiftyToolTips {
    
    public func printSomething() -> String {
        return "Third Party Library Working Successfully"
    }
    
}
