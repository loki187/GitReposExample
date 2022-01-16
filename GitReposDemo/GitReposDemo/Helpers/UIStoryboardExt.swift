//
//  UIStoryboardExt.swift
//  GitReposDemo
//
//  Created by Andrej Lukes on 16/01/2022.
//

import UIKit

public extension UIStoryboard {
    
    // MARK: - Convenience Initializers
    
    convenience init(storyboard: String, bundle: Bundle? = nil) {
        self.init(name: storyboard, bundle: bundle)
    }
    
    // MARK: - Class Functions
    
    class func storyboard(_ storyboard: String, bundle: Bundle? = nil) -> UIStoryboard {
        return UIStoryboard(name: storyboard, bundle: bundle)
    }
}
