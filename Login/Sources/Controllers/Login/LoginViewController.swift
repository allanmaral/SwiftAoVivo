//
//  LoginViewController.swift
//  Login
//
//  Created by Allan Amaral on 13/07/22.
//

import UIKit

class LoginViewController: UIViewController {
    lazy var mainView = LoginView()
    
    override func loadView() {
        super.loadView()
        
        self.view = mainView
    }
    
}
