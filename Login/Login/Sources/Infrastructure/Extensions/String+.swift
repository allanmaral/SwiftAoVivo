//
//  String+.swift
//  Login
//
//  Created by Allan Amaral on 14/07/22.
//

import Foundation

extension String {
    static let empty = String()
    
    // RegExp
    func matches(for regex: String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex, options: [])
            let nsString = self as NSString
            let results = regex.matches(in: self, options: [], range: NSMakeRange(0, nsString.length))
            return results.map { nsString.substring(with: $0.range) }
        } catch let error as NSError {
            print("invalid regex \(error.localizedDescription)")
            return []
        }
    }
    
    func masked(by pattern: String) -> String {
        let cleanNumber = self.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        var result = ""
        var index = cleanNumber.startIndex
        for char in pattern where index < cleanNumber.endIndex {
            if char == "#" {
                result.append(cleanNumber[index])
                index = cleanNumber.index(after: index)
            } else {
                result.append(char)
            }
        }
        return result
    }
}
