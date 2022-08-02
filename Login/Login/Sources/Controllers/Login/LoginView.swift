//
//  LoginView.swift
//  Login
//
//  Created by Allan Amaral on 13/07/22.
//

import UIKit

class LoginView: LGView {
    // MARK: - Closures
    var didTapRegister: (() -> Void)?
    var didTapLogin: ((_ email: String?, _ password: String?) -> Void)?
    var didSetWrongPassword: (() -> Void)?
    
    // MARK: - Visual Elements
    lazy var logoImageView: UIImageView = {
        var imageView = UIImageView(image: UIImage(named: "Logo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var emailField = LGLabelText(label: LocalizableStrings.email.localize(),
                                      placeholder: LocalizableStrings.emailPlaceholder.localize(),
                                      keyboardType: .emailAddress)
    
    lazy var passwordField = LGLabelText(label: LocalizableStrings.password.localize(),
                                         placeholder: LocalizableStrings.passwordPlaceholder.localize(),
                                         returnKeyType: .done,
                                         isSecureTextEntry: true)
    
    lazy var buttonLogin = LGButton(title: LocalizableStrings.buttonLogin.localize())
    
    lazy var buttonRegister = LGButton(title: LocalizableStrings.buttonRegister.localize(), style: .transparent)
    
    // MARK: - Setup Visual Elements
    override func setupVisualElements() {
        super.setupVisualElements()
        
        setupImageView()
        setupFieldEmail()
        setupFieldPassword()
        setupButtonLogin()
        setupButtonRegister()
    }
    
    private func setupImageView() {
        contentView.addSubview(logoImageView)
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Spacing.small),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    private func setupFieldEmail() {
        contentView.addSubview(emailField)
        emailField.textField.delegate = self
        
        NSLayoutConstraint.activate([
            emailField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: Spacing.large),
            emailField.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: LayoutContansts.horizontalMargin),
            emailField.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -LayoutContansts.horizontalMargin),
        ])
    }
    
    private func setupFieldPassword() {
        contentView.addSubview(passwordField)
        passwordField.textField.delegate = self
        
        NSLayoutConstraint.activate([
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: Spacing.medium),
            passwordField.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: LayoutContansts.horizontalMargin),
            passwordField.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -LayoutContansts.horizontalMargin),
        ])
    }
    
    private func setupButtonLogin() {
        contentView.addSubview(buttonLogin)
        buttonLogin.addTarget(self, action: #selector(loginButtonWasTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            buttonLogin.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: Spacing.large),
            buttonLogin.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: LayoutContansts.horizontalMargin),
            buttonLogin.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -LayoutContansts.horizontalMargin),
        ])
    }
    
    private func setupButtonRegister() {
        contentView.addSubview(buttonRegister)
        
        buttonRegister.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            buttonRegister.topAnchor.constraint(equalTo: buttonLogin.bottomAnchor, constant: Spacing.medium),
            buttonRegister.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: LayoutContansts.horizontalMargin),
            buttonRegister.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -LayoutContansts.horizontalMargin),
        ])
    }
    
    // MARK: - Actions
    
    @objc func loginButtonWasTapped() {
        if !RegExp.checkPasswordComplexity(password: self.passwordField.textField.text!, length: 6, patternsToEscape:[], caseSensitivty: true, numericDigits: true, specialCharacter: true) {
            print("senha nao preenche os requisitos")
            self.passwordField.textField.hasError = true
            didSetWrongPassword?()
        } else {
            self.passwordField.textField.hasError = false
            
            guard let email = self.emailField.textField.text else { return }
            guard let password = self.passwordField.textField.text else { return }
            
            didTapLogin?(email, password)
        }
    }
    
    @objc func registerTapped() {
        didTapRegister?()
    }
    
}
