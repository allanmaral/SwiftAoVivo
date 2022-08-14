//
//  AddressView.swift
//  Login
//
//  Created by Allan Amaral on 24/07/22.
//

import UIKit

class AddressView: LGView {
    
    // MARK: - Clousures
    var didSearchCep: ((_ cep: String) -> Void)?
    var didSave: ((_ street: String, _ number: String, _ city: String, _ state: String) -> Void)?
    var didSkip: (() -> Void)?
    
    // MARK: - Properties
    lazy var cepField = LGLabelText(label: LocalizableStrings.cep.localize(),
                                    placeholder: LocalizableStrings.cepPlaceholder.localize(),
                                    keyboardType: .numberPad,
                                    returnKeyType: .next)
    
    lazy var findCepButton = LGButton(image: UIImage(systemName: "magnifyingglass")!)
    
    lazy var streetField = LGLabelText(label: LocalizableStrings.street.localize(),
                                       placeholder: LocalizableStrings.streetPlaceholder.localize(),
                                       returnKeyType: .next)
    
    lazy var numberField = LGLabelText(label: LocalizableStrings.number.localize(),
                                       placeholder: LocalizableStrings.numberPlaceholder.localize(),
                                       returnKeyType: .next)
    
    lazy var cityField = LGLabelText(label: LocalizableStrings.city.localize(),
                                     placeholder: LocalizableStrings.cityPlaceholder.localize(),
                                     returnKeyType: .next)
    
    lazy var stateField = LGLabelText(label: LocalizableStrings.state.localize(),
                                      placeholder: LocalizableStrings.statePlaceholder.localize(),
                                      returnKeyType: .next)
    
    lazy var saveButton = LGButton(title: LocalizableStrings.save.localize(),
                                   style: .primary)
    
    lazy var skipButton = LGButton(title: LocalizableStrings.skip.localize(),
                                   style: .transparent)
    
    lazy var loadingIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.color = .primary
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Setup Visual Elements
    
    override func setupVisualElements() {
        super.setupVisualElements()
        
        setupCepField()
        setupStreetField()
        setupNumberField()
        setupCityField()
        setupStateField()
        setupSaveButton()
        setupSkipButton()
        
        setupLoadingIndicator()
    }
    
    private func setupCepField() {
        contentView.addSubview(cepField)
        contentView.addSubview(findCepButton)
        
        cepField.textField.delegate = self
        findCepButton.addTarget(self, action: #selector(findCepTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            cepField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Spacing.large),
            cepField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: LayoutContansts.horizontalMargin),
            cepField.trailingAnchor.constraint(equalTo: findCepButton.leadingAnchor, constant: -Spacing.small),
            
            findCepButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -LayoutContansts.horizontalMargin),
            findCepButton.topAnchor.constraint(equalTo: cepField.textField.topAnchor),
            findCepButton.bottomAnchor.constraint(equalTo: cepField.textField.bottomAnchor),
            findCepButton.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func setupStreetField() {
        contentView.addSubview(streetField)
        
        streetField.textField.delegate = self
        
        NSLayoutConstraint.activate([
            streetField.topAnchor.constraint(equalTo: cepField.textField.bottomAnchor, constant: Spacing.medium),
            streetField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: LayoutContansts.horizontalMargin),
            streetField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -LayoutContansts.horizontalMargin)
        ])
    }
    
    private func setupNumberField() {
        contentView.addSubview(numberField)
        
        numberField.textField.delegate = self
        
        NSLayoutConstraint.activate([
            numberField.topAnchor.constraint(equalTo: streetField.textField.bottomAnchor, constant: Spacing.medium),
            numberField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: LayoutContansts.horizontalMargin),
            numberField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -LayoutContansts.horizontalMargin)
        ])
    }
    
    private func setupCityField() {
        contentView.addSubview(cityField)
        
        cityField.textField.delegate = self
        
        NSLayoutConstraint.activate([
            cityField.topAnchor.constraint(equalTo: numberField.bottomAnchor, constant: Spacing.medium),
            cityField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: LayoutContansts.horizontalMargin),
            cityField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -LayoutContansts.horizontalMargin)
        ])
    }
    
    private func setupStateField() {
        contentView.addSubview(stateField)
        
        stateField.textField.delegate = self
        
        NSLayoutConstraint.activate([
            stateField.topAnchor.constraint(equalTo: cityField.bottomAnchor, constant: Spacing.medium),
            stateField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: LayoutContansts.horizontalMargin),
            stateField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -LayoutContansts.horizontalMargin)
        ])
    }
    
    private func setupSaveButton() {
        contentView.addSubview(saveButton)
        
        saveButton.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: stateField.bottomAnchor, constant: Spacing.large),
            saveButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: LayoutContansts.horizontalMargin),
            saveButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -LayoutContansts.horizontalMargin)
        ])
    }
    
    private func setupSkipButton() {
        contentView.addSubview(skipButton)
        
        skipButton.addTarget(self, action: #selector(skipTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            skipButton.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: Spacing.small),
            skipButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: LayoutContansts.horizontalMargin),
            skipButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -LayoutContansts.horizontalMargin)
        ])
    }
    
    private func setupLoadingIndicator() {
        addSubview(loadingIndicator)
        
        loadingIndicator.isHidden = true
        
        NSLayoutConstraint.activate([
            loadingIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    // MARK: - Actions
    
    @objc private func findCepTapped() {
        guard let cep = cepField.textField.text else { return }
        
        loadingIndicator.isHidden = false
        loadingIndicator.startAnimating()
        
        didSearchCep?(cep)
    }
    
    @objc private func saveTapped() {
        if let street = streetField.textField.text,
            let number = numberField.textField.text,
            let city = cityField.textField.text,
           let state = stateField.textField.text {
            didSave?(street, number, city, state)
        }
    }
    
    @objc private func skipTapped() {
        didSkip?()
    }
    
    func setAddressFromSearch(_ cepViewModel: CepViewModel) {
        stateField.textField.text = cepViewModel.state
        cityField.textField.text = cepViewModel.city
        streetField.textField.text = cepViewModel.street
        
        loadingIndicator.stopAnimating()
        loadingIndicator.isHidden = true
    }
    
}
