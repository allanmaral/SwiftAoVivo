//
//  RegisterViewTest.swift
//  LoginTests
//
//  Created by Allan Amaral on 02/08/22.
//

import XCTest
@testable
import Login

class RegisterViewTest: XCTestCase {

    // MARK: - Properties
    
    var sut: RegisterView!
    
    // MARK: Overrides
    
    override func setUp() {
        super.setUp()
        setupLoginViewTest()
    }
    
    // MARK: - Properties
    
    func setupLoginViewTest() {
        let viewController = RegisterViewController()
        sut = viewController.view as? RegisterView
    }
    
    // MARK: - When registering using a valid password, it should succed
    
    func testWhenRegisteringUsingValidPasswordItShouldSucced() {
        
        // Arrange
        let inputEmail = "teste@email.com"
        let inputPassword = "Teste@123"
        var returnedEmail: String? = nil
        var returnedPassword: String? = nil
        
        let emailTextField = sut.emailField
        emailTextField.textField.text = inputEmail
        
        let passwordTextField = sut.passwordField
        passwordTextField.textField.text = inputPassword
        
        let passwordConfirmationTextField = sut.confirmPasswordField
        passwordConfirmationTextField.textField.text = inputPassword
        
        sut.didTapRegister = { email, password in
            returnedEmail = email
            returnedPassword = password
        }
        
        // Act
        sut.registerTapped()
        
        // Assert
        XCTAssertTrue(returnedEmail == inputEmail && returnedPassword == inputPassword)
    }
    
    // MARK: - When registering using two different passwords it should not call didTapRegister
    
    func testWhenRegisteringUsingDifferentPasswordsItShouldFail() {
        
        // Arrange
        let inputEmail = "teste@email.com"
        let inputPassword = "Teste@123"
        let inputConfirmPassword = "Teste@1234"
        var didCallTapRegister = false
        
        let emailTextField = sut.emailField
        emailTextField.textField.text = inputEmail
        
        let passwordTextField = sut.passwordField
        passwordTextField.textField.text = inputPassword
        
        let passwordConfirmationTextField = sut.confirmPasswordField
        passwordConfirmationTextField.textField.text = inputConfirmPassword
        
        sut.didTapRegister = { _, _ in
            didCallTapRegister = true
        }
        
        // Act
        sut.registerTapped()
        
        // Assert
        XCTAssertFalse(didCallTapRegister)
    }
    
    // MARK: - When registering using two different passwords it should call didSetWrongPassword
    
    func testWhenRegisteringUsingDifferentPasswordsItShouldCallSetWrongPassword() {
        
        // Arrange
        let inputEmail = "teste@email.com"
        let inputPassword = "Teste@123"
        let inputConfirmPassword = "Teste@1234"
        var didCallWrongPassword = false
        
        let emailTextField = sut.emailField
        emailTextField.textField.text = inputEmail
        
        let passwordTextField = sut.passwordField
        passwordTextField.textField.text = inputPassword
        
        let passwordConfirmationTextField = sut.confirmPasswordField
        passwordConfirmationTextField.textField.text = inputConfirmPassword
        
        sut.didSetWrongPassword = {
            didCallWrongPassword = true
        }
        
        // Act
        sut.registerTapped()
        
        // Assert
        XCTAssertTrue(didCallWrongPassword)
    }
    
    // MARK: - When tapping login, it should call didTapLogin
    
    func testWhenTappingLoginItShouldCallDidTapLogin() {

        // Given
        var didCallTapLogin = false

        sut.didTapLogin = {
            didCallTapLogin = true
        }

        // When

        sut.loginTapped()

        // Then

        XCTAssertTrue(didCallTapLogin)
    }
//
//    // MARK: - RegisterButtonTapped
//
//    func testRegisterTappedSuccess() {
//        // Given
//
//        var didCallRegister = false
//        sut.didTapRegister = {
//            didCallRegister = true
//        }
//
//        // When
//
//        sut.registerTapped()
//
//        // Then
//
//        XCTAssertTrue(didCallRegister)
//    }

}
