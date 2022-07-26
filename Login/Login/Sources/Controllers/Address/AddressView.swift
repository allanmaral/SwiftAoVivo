//
//  AddressView.swift
//  Login
//
//  Created by Allan Amaral on 24/07/22.
//

import UIKit

class AddressView: LGView {

    // MARK: - Properties
    lazy var cepField: LGLabelText = LGLabelText(label: LocalizableStrings.cep.localize(),
                                                 placeholder: LocalizableStrings.cepPlaceholder.localize(),
                                                 keyboardType: .numberPad,
                                                 returnKeyType: .next)
    lazy var findCepButton = LGButton(image: UIImage(systemName: "magnifyingglass")!)
    
    
    
    // MARK: - Setup Visual Elements
    
    override func setupVisualElements() {
        super.setupVisualElements()
        
        setupCepField()
    }
    
    private func setupCepField() {
        contentView.addSubview(cepField)
        contentView.addSubview(findCepButton)
        
        cepField.textField.delegate = self
        
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
    
}
