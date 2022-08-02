//
//  LoginViewTest.swift
//  LoginTests
//
//  Created by Allan Amaral on 01/08/22.
//

import XCTest
@testable import Login

class LoginViewTest: XCTestCase {

    // MARK: - Properties
    
    var sut: LoginView!
    
    // MARK: Overrides
    
    override func setUp() {
        super.setUp()
        setupLoginViewTest()
    }
    
    // MARK: - Properties
    
    func setupLoginViewTest() {
        let viewController = LoginViewController()
        sut = viewController.view as? LoginView
    }
    
    // MARK: - loginTappedSuccess
    
    func testLoginTappedSuccess() {
        
        // Given
        var returnedEmail = ""
        var returnedPassword = ""
        
        let emailTextField = sut.emailField
        emailTextField.textField.text = "teste@email.com"
        
        let passwordTextField = sut.passwordField
        passwordTextField.textField.text = "Teste@123"
        
        sut.didTapLogin = { email, password in
            returnedEmail = email!
            returnedPassword = password!
        }
        
        // When
        
        sut.loginButtonWasTapped()
        
        // Then
        
        XCTAssertFalse(returnedEmail.isEmpty)
        XCTAssertFalse(returnedPassword.isEmpty)
    }
    
    // MARK: - loginTappedFailure
    
    func testLoginTappedFailure() {
        
        // Given
        var didCallWrongPassword = false
        
        let emailTextField = sut.emailField
        emailTextField.textField.text = "teste@email.com"
        
        let passwordTextField = sut.passwordField
        passwordTextField.textField.text = "Teste"
        
        sut.didSetWrongPassword = {
            didCallWrongPassword = true
        }
        
        // When
        
        sut.loginButtonWasTapped()
        
        // Then
        
        XCTAssertTrue(didCallWrongPassword)
    }
    
    // MARK: - RegisterButtonTapped
    
    func testRegisterTappedSuccess() {
        // Given
        
        var didCallRegister = false
        sut.didTapRegister = {
            didCallRegister = true
        }
        
        // When
        
        sut.registerTapped()
        
        // Then
        
        XCTAssertTrue(didCallRegister)
    }

}
