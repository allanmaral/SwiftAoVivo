//
//  AddressTextFieldDelegate+.swift
//  Login
//
//  Created by Allan Amaral on 25/07/22.
//

import UIKit

extension AddressView: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return false }
        let newString = (text as NSString).replacingCharacters(in: range, with: string)
        
        if textField == cepField.textField {
            textField.text = newString.masked(by: "#####-###")
        }
        
        return false
    }
    
}
