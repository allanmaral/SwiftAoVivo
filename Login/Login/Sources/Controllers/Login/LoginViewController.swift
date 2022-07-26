//
//  LoginViewController.swift
//  Login
//
//  Created by Allan Amaral on 13/07/22.
//

import UIKit

class LoginViewController: LGViewController {
    
    // MARK: - Clousures
    var didTapRegister: (() -> Void)?
    var didTapLogin: ((_ email: String, _ password: String) -> Void)?
    
    // MARK: - View
    lazy var loginView: LoginView = {
        let view = LoginView()
        view.didTapRegister = { [weak self] in
            self?.didTapRegister?()
        }
        view.didSetWrongPassword = { [weak self] in
            self?.onWrongPassword()
        }
        view.didTapLogin = { [weak self] email, password in
            guard let email = email, let password = password else { return }
            self?.didTapLogin?(email, password)
        }
        return view
    }()
    
    override func loadView() {
        super.loadView()
        
        self.view = loginView
        self.title = LocalizableStrings.login.localize()
    }
    
    private func onWrongPassword() {
        let alertController = UIAlertController(title: "Erro", message: "Senha fora do padrão", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertController, animated: true)
    }
    
}
