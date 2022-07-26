//
//  LGLabelText.swift
//  Login
//
//  Created by Allan Amaral on 14/07/22.
//

import UIKit

class LGLabelText: UIView {
    
    // MARK: - Constants
    struct Constants {
        static let showPasswordImage = UIImage(systemName: "eye.fill")!;
        static let hidePasswordImage = UIImage(systemName: "eye.slash.fill")!;
        static let hozizontalPadding = Spacing.medium
    }
    
    // MARK: - Properties
    lazy private var label = LGLabel(text: String.empty)
    lazy var textField = LGTextField(placeholder: String.empty)
    
    init(label: String, placeholder: String, font: UIFont = .input, keyboardType: UIKeyboardType = .default, returnKeyType: UIReturnKeyType = .next, isSecureTextEntry: Bool = false) {
        super.init(frame: .zero)
        self.label.text = label
        self.textField.placeholder = placeholder
        self.textField.font = font
        self.textField.keyboardType = keyboardType
        self.textField.returnKeyType = returnKeyType
        self.textField.isSecureTextEntry = isSecureTextEntry
        
        setupVisualElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupVisualElements() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        setupLabel()
        setupTextField()
    }
    
    func setupLabel() {
        self.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.leftAnchor.constraint(equalTo: self.leftAnchor),
            label.rightAnchor.constraint(equalTo: self.rightAnchor),
        ])
    }
    
    func setupTextField() {
        self.addSubview(textField)
        
        if self.textField.isSecureTextEntry {
            setupShowPasswordButton()
        }
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: Spacing.small),
            textField.leftAnchor.constraint(equalTo: self.leftAnchor),
            textField.rightAnchor.constraint(equalTo: self.rightAnchor),
            
            self.bottomAnchor.constraint(equalTo: textField.bottomAnchor)
        ])
    }
    
    func setupShowPasswordButton() {
        let rightButton = UIButton(type: .custom)
        rightButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        rightButton.setImage(Constants.showPasswordImage, for: .normal)
        rightButton.addTarget(self, action: #selector(didChangePasswordVisibility), for: .touchUpInside)
        
        let container = UIView(frame: CGRect(x: 0, y: 0, width: 30 + Constants.hozizontalPadding, height: 30))
        container.addSubview(rightButton)
        
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rightButton.topAnchor.constraint(equalTo: container.topAnchor),
            rightButton.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            rightButton.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            rightButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -Constants.hozizontalPadding),
        ])
        
        self.textField.rightViewMode = .always
        self.textField.rightView = container
    }
    
    @objc private func didChangePasswordVisibility(_ sender: UIButton) {
        self.textField.isSecureTextEntry.toggle()
        let buttonImage = self.textField.isSecureTextEntry ? Constants.showPasswordImage : Constants.hidePasswordImage
        sender.setImage(buttonImage, for: .normal)
    }
}
