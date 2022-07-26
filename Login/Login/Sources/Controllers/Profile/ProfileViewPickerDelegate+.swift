//
//  ProfileViewPickerDelegateExtension.swift
//  Login
//
//  Created by Allan Amaral on 24/07/22.
//

import UIKit

extension ProfileView: UIPickerViewDelegate, UIPickerViewDataSource, LGPickerDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == agePicker {
            return Age.allCases.count
        } else if pickerView == genderPicker {
            return Gender.allCases.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == agePicker {
            return Age.allCases[row].rawValue
        } else if pickerView == genderPicker {
            return Gender.allCases[row].rawValue
        }
        return nil
    }
    
    
    // MARK: - Toolbar delegate
    
    func didTapDone(_ picker: LGPicker) {
        let row = picker.selectedRow(inComponent: 0)
        
        if picker == agePicker {
            ageField.textField.text = Age.allCases[row].rawValue
            ageField.textField.resignFirstResponder()
        } else if picker == genderPicker {
            genderField.textField.text = Gender.allCases[row].rawValue
            genderField.textField.resignFirstResponder()
        }
    }
    
    func didTapCancel(_ picker: LGPicker) {
        if picker == agePicker {
            ageField.textField.resignFirstResponder()
        } else if picker == genderPicker {
            genderField.textField.resignFirstResponder()
        }
    }
    
}
