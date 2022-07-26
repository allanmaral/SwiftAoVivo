//
//  Gender.swift
//  Login
//
//  Created by Allan Amaral on 25/07/22.
//

enum Gender: String, CaseIterable {
    case male = "👨"
    case female = "👩"
    case undefined = "Não quero informar"
    
    func asInt() -> Int {
        Gender.allCases.firstIndex(of: self) ?? 0
    }
}
