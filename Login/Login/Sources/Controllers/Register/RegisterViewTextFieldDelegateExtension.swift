//
//  RegisterViewTextFieldDelegateExtension.swift
//  Login
//
//  Created by Allan Amaral on 24/07/22.
//

import UIKit

extension RegisterView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailField.textField {
            self.passwordField.textField.becomeFirstResponder()
        } else if textField == passwordField.textField {
            self.confirmPasswordField.becomeFirstResponder()
        } else if textField == confirmPasswordField.textField {
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let textField = textField as? LGTextField else { return }
        
        // TODO: Move to a validate email user case
        if textField == passwordField.textField || textField == confirmPasswordField.textField {
            if !RegExp.checkPasswordComplexity(password: textField.text!,
                                               length: 6,
                                               patternsToEscape:[],
                                               caseSensitivty: true,
                                               numericDigits: true,
                                               specialCharacter: true) {
                textField.hasError = true
            } else {
                textField.hasError = false
            }
        }
    }
    
}
