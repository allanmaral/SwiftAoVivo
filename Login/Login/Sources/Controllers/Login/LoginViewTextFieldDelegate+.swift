//
//  LoginViewTextFieldDelegateExtension.swift
//  Login
//
//  Created by Allan Amaral on 18/07/22.
//

import UIKit

extension LoginView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailField.textField {
            self.passwordField.textField.becomeFirstResponder()
        } else if textField == passwordField.textField {
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        // Colocar validação
    }
    
}
