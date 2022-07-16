//
//  LoginView.swift
//  Login
//
//  Created by Allan Amaral on 13/07/22.
//

import UIKit

class LoginView: UIView {
    
    // MARK: - Visual Elements
    lazy var logoImageView: UIImageView = {
        var imageView = UIImageView(image: UIImage(named: "Logo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var emailField = LGLabelText(label: LocalizableStrings.email.localize(),
                                      placeholder: LocalizableStrings.emailPlaceholder.localize(),
                                      font: .input,
                                      keyboardType: .emailAddress,
                                      returnKeyType: .next)
    
    lazy var passwordField = LGLabelText(label: LocalizableStrings.password.localize(),
                                         placeholder: LocalizableStrings.passwordPlaceholder.localize())
    
    lazy var buttonLogin = LGButton(title: LocalizableStrings.buttonLogin.localize())
    
    lazy var buttonRegister = LGButton(title: LocalizableStrings.buttonRegister.localize(), style: .transparent)
    
    // MARK: - Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .viewBackground
        
        setupVisualElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Visual Elements
    private func setupVisualElements() {
        setupImageView()
        setupFieldEmail()
        setupFieldPassword()
        setupButtonLogin()
        setupButtonRegister()
    }
    
    private func setupImageView() {
        self.addSubview(logoImageView)
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: Spacing.extraLarge),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    private func setupFieldEmail() {
        self.addSubview(emailField)
        
        NSLayoutConstraint.activate([
            emailField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: Spacing.large),
            emailField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: LayoutContansts.horizontalMarging),
            emailField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -LayoutContansts.horizontalMarging),
        ])
    }
    
    private func setupFieldPassword() {
        self.addSubview(passwordField)
        
        NSLayoutConstraint.activate([
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: Spacing.medium),
            passwordField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: LayoutContansts.horizontalMarging),
            passwordField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -LayoutContansts.horizontalMarging),
        ])
    }
    
    private func setupButtonLogin() {
        self.addSubview(buttonLogin)
        
        NSLayoutConstraint.activate([
            buttonLogin.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: Spacing.large),
            buttonLogin.leftAnchor.constraint(equalTo: self.leftAnchor, constant: LayoutContansts.horizontalMarging),
            buttonLogin.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -LayoutContansts.horizontalMarging),
        ])
    }
    
    private func setupButtonRegister() {
        self.addSubview(buttonRegister)
        
        NSLayoutConstraint.activate([
            buttonRegister.topAnchor.constraint(equalTo: buttonLogin.bottomAnchor, constant: Spacing.medium),
            buttonRegister.leftAnchor.constraint(equalTo: self.leftAnchor, constant: LayoutContansts.horizontalMarging),
            buttonRegister.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -LayoutContansts.horizontalMarging),
        ])
    }
    
}
