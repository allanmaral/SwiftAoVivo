//
//  LGLabelText.swift
//  Login
//
//  Created by Allan Amaral on 14/07/22.
//

import UIKit

class LGLabelText: UIView {
    
    // MARK: - Properties
    lazy private var label = LGLabel(text: String.empty)
    lazy private var textField = LGTextField(placeholder: String.empty)
    
    init(label: String, placeholder: String) {
        super.init(frame: .zero)
        self.label.text = label
        self.textField.placeholder = placeholder
        
        setupVisualElements()
    }
    
    init(label: String, placeholder: String, font: UIFont, keyboardType: UIKeyboardType, returnKeyType: UIReturnKeyType) {
        super.init(frame: .zero)
        self.label.text = label
        self.textField.placeholder = placeholder
        self.textField.font = font
        self.textField.keyboardType = keyboardType
        self.textField.returnKeyType = returnKeyType
        
        setupVisualElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupVisualElements() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)
        self.addSubview(textField)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.leftAnchor.constraint(equalTo: self.leftAnchor),
            label.rightAnchor.constraint(equalTo: self.rightAnchor),
            
            textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: Spacing.small),
            textField.leftAnchor.constraint(equalTo: self.leftAnchor),
            textField.rightAnchor.constraint(equalTo: self.rightAnchor),
            
            self.bottomAnchor.constraint(equalTo: textField.bottomAnchor)
        ])
    }
}
