//
//  LocalizableStrings.swift
//  Login
//
//  Created by Allan Amaral on 13/07/22.
//

import Foundation

enum LocalizableStrings: String {
    case email
    case emailPlaceholder
    case password
    case passwordPlaceholder
    case buttonLogin
    case buttonRegister
    
    func localize() -> String {
        rawValue.localizeInCurrentBundle()
    }
}

enum LocalizableAccessibilityStrings: String {
    case email
    
    func localize() -> String {
        rawValue.localizeInCurrentBundle(true)
    }
}

extension String {
    func localizeInCurrentBundle(_ accessibility: Bool = false) -> String {
        let path: Bundle = .current
        
        return NSLocalizedString(self,
                                 tableName: accessibility
                                    ? "LoginAccessibilityLocalizable"
                                    : "LoginLocalizable",
                                 bundle: path,
                                 value: String(),
                                 comment: String())
    }
}

extension Bundle {
    static var current: Bundle {
        class DummyClass {
            init() {
                
            }
        }
        
        return Bundle(for: DummyClass.self)
    }
}

