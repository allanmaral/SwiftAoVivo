//
//  LGButton.swift
//  Login
//
//  Created by Allan Amaral on 13/07/22.
//

import UIKit

class LGButton: UIButton {
    private struct Constants {
        static let font = UIFont.label
    }
    
    let style: LGButtonStyle
    let size: LGButtonSize
    
    init(title: String, style: LGButtonStyle = .primary, size: LGButtonSize = .normal) {
        self.style = style
        self.size = size
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
        self.layer.cornerRadius = size.height / 2
        self.titleLabel?.font = Constants.font
    }
    
    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.height = size.height
        return contentSize
    }
}

struct LGButtonStyle {
    let backgroundColor: UIColor
    let textColor: UIColor
    
    static let primary = LGButtonStyle(backgroundColor: .primary, textColor: .skyWhite)
    static let transparent = LGButtonStyle(backgroundColor: .clear, textColor: .primary)
}

struct LGButtonSize {
    let height: CGFloat
    
    static let normal = LGButtonSize(height: 48)
    static let small = LGButtonSize(height: 32)
}
