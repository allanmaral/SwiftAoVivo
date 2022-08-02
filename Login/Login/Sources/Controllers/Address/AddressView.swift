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
    
    // MARK: - Properties
    lazy var cepField = LGLabelText(label: LocalizableStrings.cep.localize(),
                                    placeholder: LocalizableStrings.cepPlaceholder.localize(),
                                    keyboardType: .numberPad,
                                    returnKeyType: .next)
    lazy var findCepButton = LGButton(image: UIImage(systemName: "magnifyingglass")!)
    lazy var streeField = LGLabelText(label: "Rua",
                                      placeholder: "Informe sua rua")
    
    
    
    // MARK: - Setup Visual Elements
    
    override func setupVisualElements() {
        super.setupVisualElements()
        
        setupCepField()
        setupStreetField()
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
        contentView.addSubview(streeField)
        
        streeField.textField.delegate = self
        
        NSLayoutConstraint.activate([
            streeField.topAnchor.constraint(equalTo: cepField.textField.bottomAnchor, constant: Spacing.medium),
            streeField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: LayoutContansts.horizontalMargin),
            streeField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -LayoutContansts.horizontalMargin)
        ])
    }
    
    // MARK: - Actions
    
    @objc private func findCepTapped() {
        guard let cep = cepField.textField.text else { return }
        didSearchCep?(cep)
        
//        lazy var indicator: UIActivityIndicatorView = {
//            let view = UIActivityIndicatorView(style: .large)
//            view.color = .red
//            view.startAnimating()
//            view.translatesAutoresizingMaskIntoConstraints = false
//            return view
//        }()
//
//        addSubview(indicator)
//
//        NSLayoutConstraint.activate([
//            indicator.centerXAnchor.constraint(equalTo: centerXAnchor),
//            indicator.centerYAnchor.constraint(equalTo: centerYAnchor)
//        ])
    }
    
    func setAddressFromSearch(_ cepViewModel: CepViewModel) {
        DispatchQueue.main.async {
            self.streeField.textField.text = cepViewModel.street
        }
    }
    
}
