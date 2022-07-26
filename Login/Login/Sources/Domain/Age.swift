//
//  Age.swift
//  Login
//
//  Created by Allan Amaral on 25/07/22.
//

enum Age: String, CaseIterable {
    case zeroToFifteen = "0...15"
    case sixteenToTwentyFive = "16...25"
    case twentySixToThirtyFive = "26...35"
    case thirtySixToFifty = "36...50"
    case fiftyOrMore = ">50"
    
    func asInt() -> Int {
        Age.allCases.firstIndex(of: self) ?? 0
    }
}
