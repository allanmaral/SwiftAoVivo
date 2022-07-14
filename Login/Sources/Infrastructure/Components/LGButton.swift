//
//  LGButton.swift
//  Login
//
//  Created by Allan Amaral on 13/07/22.
//

import UIKit

class LGButton: UIButton {
    let style: LGButtonStyle
    
    init(title: String, style: LGButtonStyle = .primary) {
        self.style = style
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        
        initDefault()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initDefault() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = style.backgroundColor
        self.setTitleColor(style.textColor, for: .normal)
        self.layer.cornerRadius = Constants.buttonCornerRadius
    }
}

struct LGButtonStyle {
    let backgroundColor: UIColor
    let textColor: UIColor
    
    static let primary = LGButtonStyle(backgroundColor: .buttonBackground, textColor: .buttonTextColor)
    static let secondary = LGButtonStyle(backgroundColor: .clear, textColor: .labelTextColor)
}
