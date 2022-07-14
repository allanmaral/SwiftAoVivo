//
//  LGTextField.swift
//  Login
//
//  Created by Allan Amaral on 14/07/22.
//

import UIKit

class LGTextField: UITextField {
    
    convenience init(placeholder: String) {
        self.init(placeholder: placeholder, font: .systemFont(ofSize: 14), keyboardType: .default, returnKeyType: .done)
    }
    
    convenience init(placeholder: String, keyboardType: UIKeyboardType, returnKeyType: UIReturnKeyType) {
        self.init(placeholder: placeholder, font: .systemFont(ofSize: 14), keyboardType: keyboardType, returnKeyType: returnKeyType)
    }

    init(placeholder: String, font: UIFont, keyboardType: UIKeyboardType, returnKeyType: UIReturnKeyType) {
        super.init(frame: .zero)
        
        self.placeholder = placeholder
        self.font = font
        self.keyboardType = keyboardType
        self.returnKeyType = returnKeyType
        
        initDefault()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initDefault() {
        self.layer.cornerRadius = CornerRadius.small
        self.layer.borderWidth = 1
        self.translatesAutoresizingMaskIntoConstraints = false
        self.borderStyle = .roundedRect
        self.clearButtonMode = .whileEditing
    }

}
