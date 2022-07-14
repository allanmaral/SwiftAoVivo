//
//  Color+.swift
//  Login
//
//  Created by Allan Amaral on 13/07/22.
//

import UIKit

extension UIColor {
    static var buttonBackground: UIColor {
        return UIColor(named: "ButtonBackground") ?? .red
    }
    
    static var buttonTextColor: UIColor {
        return UIColor(named: "ButtonTextColor") ?? .red
    }
    
    static var labelTextColor: UIColor {
        return UIColor(named: "LabelTextColor") ?? .red
    }
    
    static var viewBackgroundColor: UIColor {
        return UIColor(named: "ViewBackground") ?? .red
    }
}
