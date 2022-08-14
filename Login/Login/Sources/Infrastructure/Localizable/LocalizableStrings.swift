//
//  LocalizableStrings.swift
//  Login
//
//  Created by Allan Amaral on 13/07/22.
//

import Foundation

enum LocalizableStrings: String {
    // MARK: - Misc
    case done
    case cancel
    case skip
    case save
    
    // MARK: - Login / Regiser Screen
    case email
    case emailPlaceholder
    case password
    case passwordPlaceholder
    case confirmPassword
    case confirmPasswordPlaceholder
    case buttonLogin
    case buttonRegister
    case login
    case register
    
    // MARK: - Profile Screen
    case profile
    case age
    case agePlaceholder
    case gender
    case genderPlaceholder
    case cpf
    case cpfPlaceholder
    case phone
    case phonePlaceholder
    case next
    
    // MARK: - Address Screen
    case address
    case cep
    case cepPlaceholder
    case state
    case statePlaceholder
    case city
    case cityPlaceholder
    case neighbourhood
    case neighbourhoodPlaceholder
    case street
    case streetPlaceholder
    case number
    case numberPlaceholder
    
    // MARK: - Home Screen
    case home
    
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

