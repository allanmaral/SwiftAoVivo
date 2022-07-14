//
//  LoginView.swift
//  Login
//
//  Created by Allan Amaral on 13/07/22.
//

import UIKit

class LoginView: UIView {
    
    // MARK: - Visual Elements
    lazy var emailField = LGLabelText(label: LocalizableStrings.email.localize(),
                                      placeholder: LocalizableStrings.emailPlaceholder.localize(),
                                      font: .systemFont(ofSize: 14),
                                      keyboardType: .emailAddress,
                                      returnKeyType: .next)
    
    lazy var passwordField = LGLabelText(label: LocalizableStrings.password.localize(),
                                         placeholder: LocalizableStrings.passwordPlaceholder.localize())
    
    lazy var buttonLogin = LGButton(title: LocalizableStrings.buttonLogin.localize())
    
    lazy var buttonRegister = LGButton(title: LocalizableStrings.buttonRegister.localize(), style: .secondary)
    
    // MARK: - Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .viewBackgroundColor
        
        setupVisualElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Visual Elements
    private func setupVisualElements() {
        setupFieldEmail()
        setupFieldPassword()
        setupButtonLogin()
        setupButtonRegister()
    }
    
    private func setupFieldEmail() {
        self.addSubview(emailField)
        
        NSLayoutConstraint.activate([
            emailField.topAnchor.constraint(equalTo: self.topAnchor, constant: 60),
            emailField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
            emailField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12),
        ])
    }
    
    private func setupFieldPassword() {
        self.addSubview(passwordField)
        
        NSLayoutConstraint.activate([
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 20),
            passwordField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
            passwordField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12),
        ])
    }
    
    private func setupButtonLogin() {
        self.addSubview(buttonLogin)
        
        NSLayoutConstraint.activate([
            buttonLogin.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 40),
            buttonLogin.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
            buttonLogin.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12),
        ])
    }
    
    private func setupButtonRegister() {
        self.addSubview(buttonRegister)
        
        NSLayoutConstraint.activate([
            buttonRegister.topAnchor.constraint(equalTo: buttonLogin.bottomAnchor, constant: 20),
            buttonRegister.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
            buttonRegister.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12),
        ])
    }
    
}
