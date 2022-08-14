//
//  AddressTextFieldDelegate+.swift
//  Login
//
//  Created by Allan Amaral on 25/07/22.
//

import UIKit

extension AddressView: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let newString = (text as NSString).replacingCharacters(in: range, with: string)
        
        if textField == cepField.textField {
            textField.text = newString.masked(by: "#####-###")
            return false
        }
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case cepField.textField:
            streetField.textField.becomeFirstResponder()
        case streetField.textField:
            numberField.textField.becomeFirstResponder()
        case numberField.textField:
            cityField.textField.becomeFirstResponder()
        case cityField.textField:
            stateField.textField.becomeFirstResponder()
        case stateField.textField:
            textField.resignFirstResponder()
        default:
            return true
        }
        
        return true
    }
    
}
