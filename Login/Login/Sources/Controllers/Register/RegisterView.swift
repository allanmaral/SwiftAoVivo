//
//  RegisterView.swift
//  Login
//
//  Created by Allan Amaral on 20/07/22.
//

import UIKit

class RegisterView: LGView {
    // MARK: - Clousures
    var didTapRegister: ((_ email: String, _ password: String) -> Void)?
    var didTapLogin: (() -> Void)?
    var didSetWrongPassword: (() -> Void)?

    // MARK: - Properties
    lazy var emailField = LGLabelText(label: LocalizableStrings.email.localize(),
                                      placeholder: LocalizableStrings.emailPlaceholder.localize(),
                                      keyboardType: .emailAddress)
    lazy var passwordField = LGLabelText(label: LocalizableStrings.password.localize(),
                                         placeholder: LocalizableStrings.passwordPlaceholder.localize(),
                                         isSecureTextEntry: true)
    lazy var confirmPasswordField = LGLabelText(label: LocalizableStrings.confirmPassword.localize(),
                                                placeholder: LocalizableStrings.confirmPasswordPlaceholder.localize(),
                                                returnKeyType: .done,
                                                isSecureTextEntry: true)
    lazy var buttonRegister = LGButton(title: LocalizableStrings.buttonRegister.localize())
    lazy var buttonLogin = LGButton(title: LocalizableStrings.buttonLogin.localize(), style: .transparent)

    // MARK: - Visual Elements
    override func setupVisualElements() {
        super.setupVisualElements()
        
        setupFieldEmail()
        setupFieldPassword()
        setupFieldConfirmPassword()
        setupButtonRegister()
        setupButtonLogin()
    }
    
    private func setupFieldEmail() {
        contentView.addSubview(emailField)
        emailField.textField.delegate = self
        
        NSLayoutConstraint.activate([
            emailField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Spacing.large),
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
    
    private func setupFieldConfirmPassword() {
        contentView.addSubview(confirmPasswordField)
        confirmPasswordField.textField.delegate = self
        
        NSLayoutConstraint.activate([
            confirmPasswordField.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: Spacing.medium),
            confirmPasswordField.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: LayoutContansts.horizontalMargin),
            confirmPasswordField.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -LayoutContansts.horizontalMargin),
        ])
    }
    
    private func setupButtonRegister() {
        contentView.addSubview(buttonRegister)
        buttonRegister.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            buttonRegister.topAnchor.constraint(equalTo: confirmPasswordField.bottomAnchor, constant: Spacing.large),
            buttonRegister.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: LayoutContansts.horizontalMargin),
            buttonRegister.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -LayoutContansts.horizontalMargin),
        ])
    }
    
    private func setupButtonLogin() {
        contentView.addSubview(buttonLogin)
        buttonLogin.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            buttonLogin.topAnchor.constraint(equalTo: buttonRegister.bottomAnchor, constant: Spacing.medium),
            buttonLogin.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: LayoutContansts.horizontalMargin),
            buttonLogin.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -LayoutContansts.horizontalMargin),
        ])
    }
    
    
    // MARK: - Actions
    
    @objc private func registerTapped() {
        if !RegExp.checkPasswordComplexity(password: self.passwordField.textField.text!, length: 6, patternsToEscape:[], caseSensitivty: true, numericDigits: true, specialCharacter: true) {
            print("senha nao preenche os requisitos")
            self.passwordField.textField.hasError = true
            didSetWrongPassword?()
        } else {
            self.passwordField.textField.hasError = false
            
            guard let email = self.emailField.textField.text else { return }
            guard let password = self.passwordField.textField.text else { return }
            
            didTapRegister?(email, password)
        }
    }
    
    @objc private func loginTapped() {
        didTapLogin?()
    }

}
