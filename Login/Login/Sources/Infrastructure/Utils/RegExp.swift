//
//  RegExp.swift
//  Login
//
//  Created by Allan Amaral on 18/07/22.
//

import Foundation

struct RegExp {
    /**
     Check password complexity
     - parameter password:         password to test
     - parameter length:           password min length
     - parameter patternsToEscape: patterns that password must not contains
     - parameter caseSensitivty:   specify if password must conforms case sensitivity or not
     - parameter numericDigits:    specify if password must conforms contains numeric digits or not
     - returns: boolean that describes if password is valid or not
     */
    static func checkPasswordComplexity(password: String, length: Int, patternsToEscape: [String], caseSensitivty: Bool, numericDigits: Bool, specialCharacter: Bool) -> Bool {
        if (password.count < length) {
            return false
        }
        if caseSensitivty {
            let hasUpperCase = password.matches(for: "[A-Z]").count > 0
            if !hasUpperCase {
                return false
            }
            let hasLowerCase = password.matches(for: "[a-z]").count > 0
            if !hasLowerCase {
                return false
            }
        }
        if numericDigits {
            let hasNumbers = password.matches(for: "\\d").count > 0
            if !hasNumbers {
                return false
            }
        }
        if specialCharacter {
            let specialCharacter = password.matches(for: "[!@#\\$%\\^&\\*]").count > 0
            if !specialCharacter {
                return false
            }
        }
        if patternsToEscape.count > 0 {
            let passwordLowerCase = password.lowercased()
            for pattern in patternsToEscape {
                let hasMatchesWithPattern = passwordLowerCase.matches(for: pattern).count > 0
                if hasMatchesWithPattern {
                    return false
                }
            }
        }
        
        return true
    }
}
