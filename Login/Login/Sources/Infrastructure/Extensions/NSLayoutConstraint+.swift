//
//  NSLayoutConstraint+.swift
//  Login
//
//  Created by Allan Amaral on 18/07/22.
//

import UIKit

extension NSLayoutConstraint {
    
    func withPriority(_ p: UILayoutPriority) -> Self {
        self.priority = p
        return self
    }
    
}
