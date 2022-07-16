//
//  Color+.swift
//  Login
//
//  Created by Allan Amaral on 13/07/22.
//

import UIKit

extension UIColor {
    static var primary: UIColor {
        UIColor(named: "LGPrimary") ?? .red
    }
    static var skyWhite: UIColor {
        UIColor(named: "LGSkyWhite") ?? .red
    }
    
    static var viewBackground: UIColor {
        return UIColor(named: "LGBackground") ?? .red
    }
    
    static var inputBackground: UIColor {
        UIColor(named: "LGInputBackground") ?? .red
    }
    static var inputBorder: UIColor {
        UIColor(named: "LGInputBorder") ?? .red
    }
    static var inputPlaceholder: UIColor {
        UIColor(named: "LGInputPlaceholder") ?? .red
    }
    
    static var labelText: UIColor {
        UIColor(named: "LGLabelText") ?? .red
    }
    
    static var buttonTransparentText: UIColor {
        UIColor(named: "LGButtonTransparentText") ?? .red
    }
}
