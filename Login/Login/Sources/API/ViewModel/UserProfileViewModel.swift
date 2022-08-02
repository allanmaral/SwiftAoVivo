//
//  UserProfileViewModel.swift
//  Login
//
//  Created by Allan Amaral on 31/07/22.
//

import UIKit

struct FlowViewModel {
    let navigationController: UINavigationController
    let userProfileViewModel: UserProfileViewModel
    
    init(navigationController: UINavigationController, userProfileViewModel: UserProfileViewModel) {
        self.navigationController = navigationController
        self.userProfileViewModel = userProfileViewModel
    }
}

class UserProfileViewModel {
    
    var email: String
    var age: String
    var gender: String
    var cpf: String
    var phone: String
    var state: String
    var city: String
    var neighbourhood: String
    var street: String
    var number: String
    
    init() {
        self.email = String()
        self.age = String()
        self.gender = String()
        self.cpf = String()
        self.phone = String()
        self.state = String()
        self.city = String()
        self.neighbourhood = String()
        self.street = String()
        self.number = String()
    }
    
}
