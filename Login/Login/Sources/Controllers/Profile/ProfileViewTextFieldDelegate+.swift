//
//  ProfileViewTextFieldDelegate+.swift
//  Login
//
//  Created by Allan Amaral on 24/07/22.
//

import UIKit

extension ProfileView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.ageField.textField {
            self.genderField.textField.becomeFirstResponder()
        } else if textField == self.genderField.textField {
            self.cpfField.textField.becomeFirstResponder()
        } else if textField == self.cpfField.textField {
            self.phoneField.textField.becomeFirstResponder()
        } else if textField == self.phoneField.textField {
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return false }
        let newString = (text as NSString).replacingCharacters(in: range, with: string)
        
        if textField == cpfField.textField {
            textField.text = newString.masked(by: "###.###.###-##")
        } else if textField == phoneField.textField {
            textField.text = newString.masked(by: "(##) #####-####")
        } else {
            textField.text = newString
        }
        return false
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        if textField == cpfField.textField {
            if CpfValidator.validate(text) {
                cpfField.textField.hasError = false
            } else {
                cpfField.textField.hasError = true
            }
        }
    }
    
}
