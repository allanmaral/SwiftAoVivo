//
//  ProfileView.swift
//  Login
//
//  Created by Allan Amaral on 20/07/22.
//

import UIKit

class ProfileView: LGView {

    // MARK: - Clousures
    
    var didTapNext: ((_ age: String, _ gender: String, _ cpf: String, _ phone: String) -> Void)?
    
    // MARK: - Properties
    lazy var ageField = LGLabelText(label: LocalizableStrings.age.localize(),
                                    placeholder: LocalizableStrings.agePlaceholder.localize(),
                                    returnKeyType: .next)
    lazy var agePicker = LGPicker();
    lazy var genderField = LGLabelText(label: LocalizableStrings.gender.localize(),
                                       placeholder: LocalizableStrings.genderPlaceholder.localize(),
                                       returnKeyType: .next)
    lazy var genderPicker = LGPicker();
    lazy var cpfField = LGLabelText(label: LocalizableStrings.cpf.localize(),
                                    placeholder: LocalizableStrings.cpfPlaceholder.localize(),
                                    keyboardType: .numbersAndPunctuation,
                                    returnKeyType: .next)
    lazy var phoneField = LGLabelText(label: LocalizableStrings.phone.localize(),
                                      placeholder: LocalizableStrings.phonePlaceholder.localize(),
                                      keyboardType: .numbersAndPunctuation,
                                      returnKeyType: .done)
    
    lazy var nextButton = LGButton(title: LocalizableStrings.next.localize(),
                                   style: .primary)
    
    
    // MARK: - Setup Visual Elements
    
    override func setupVisualElements() {
        super.setupVisualElements()
        
        setupAgeField()
        setupGenderField()
        setupCpfField()
        setupPhoneField()
        setupNextButton()
    }
    
    private func setupAgeField() {
        contentView.addSubview(ageField)
        ageField.textField.delegate = self
        ageField.textField.inputView = agePicker
        ageField.textField.inputAccessoryView = agePicker.toolbar
        
        agePicker.delegate = self
        agePicker.dataSource = self
        agePicker.toolbarDelegate = self
        
        NSLayoutConstraint.activate([
            ageField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Spacing.large),
            ageField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: LayoutContansts.horizontalMargin),
            ageField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -LayoutContansts.horizontalMargin)
        ])
    }
    
    private func setupGenderField() {
        contentView.addSubview(genderField)
        genderField.textField.delegate = self
        genderField.textField.inputView = genderPicker
        genderField.textField.inputAccessoryView = genderPicker.toolbar
        
        genderPicker.delegate = self
        genderPicker.dataSource = self
        genderPicker.toolbarDelegate = self
        
        NSLayoutConstraint.activate([
            genderField.topAnchor.constraint(equalTo: ageField.bottomAnchor, constant: Spacing.medium),
            genderField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: LayoutContansts.horizontalMargin),
            genderField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -LayoutContansts.horizontalMargin)
        ])
    }
    
    private func setupCpfField() {
        contentView.addSubview(cpfField)
        cpfField.textField.delegate = self
        
        NSLayoutConstraint.activate([
            cpfField.topAnchor.constraint(equalTo: genderField.bottomAnchor, constant: Spacing.medium),
            cpfField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: LayoutContansts.horizontalMargin),
            cpfField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -LayoutContansts.horizontalMargin)
        ])
    }
    
    private func setupPhoneField() {
        contentView.addSubview(phoneField)
        phoneField.textField.delegate = self
        
        NSLayoutConstraint.activate([
            phoneField.topAnchor.constraint(equalTo: cpfField.bottomAnchor, constant: Spacing.medium),
            phoneField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: LayoutContansts.horizontalMargin),
            phoneField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -LayoutContansts.horizontalMargin)
        ])
    }
    
    private func setupNextButton() {
        contentView.addSubview(nextButton)
        nextButton.addTarget(self, action: #selector(nextTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            nextButton.topAnchor.constraint(equalTo: phoneField.bottomAnchor, constant: Spacing.large),
            nextButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: LayoutContansts.horizontalMargin),
            nextButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -LayoutContansts.horizontalMargin)
        ])
    }
    
    // MARK: - Actions
    
    @objc func nextTapped() {
        guard let age = ageField.textField.text,
              let gender = genderField.textField.text,
              let cpf = cpfField.textField.text,
              let phone = phoneField.textField.text else { return }
        
        didTapNext?(age, gender, cpf, phone)
    }
    
}
