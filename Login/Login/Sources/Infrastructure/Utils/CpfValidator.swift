//
//  CpfValidator.swift
//  Login
//
//  Created by Allan Amaral on 24/07/22.
//

import Foundation

struct CpfValidator {
    
    private static func cpfDigit<T: Collection>(_ collection: T) -> Int where T.Element == Int {
        var number = collection.count + 2
        let digit = 11 - collection.reduce(into: 0) {
            number -= 1
            $0 += $1 * number
        } % 11
        return digit > 9 ? 0 : digit
    }
    
    static func validate(_ cpf: String) -> Bool {
        let numbers = cpf.compactMap(\.wholeNumberValue)
        guard numbers.count == 11 && Set(numbers).count != 1 else { return false }
        return cpfDigit(numbers.prefix(9)) == numbers[9] && cpfDigit(numbers.prefix(10)) == numbers[10]
    }
    
}
