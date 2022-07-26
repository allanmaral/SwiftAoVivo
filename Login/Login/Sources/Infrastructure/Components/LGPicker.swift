//
//  LGPicker.swift
//  Login
//
//  Created by Allan Amaral on 24/07/22.
//

import UIKit

protocol LGPickerDelegate: AnyObject {
    func didTapDone(_ picker: LGPicker)
    func didTapCancel(_ picker: LGPicker)
}

class LGPicker: UIPickerView {
    
    // MARK: - Properties
    
    public private(set) var toolbar: UIToolbar!
    public weak var toolbarDelegate: LGPickerDelegate?
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initDefault()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup toolbar
    
    private func initDefault() {
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: LocalizableStrings.done.localize(), style: .plain, target: self, action: #selector(doneTapped))
        let spacerButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: LocalizableStrings.cancel.localize(), style: .plain, target: self, action: #selector(cancelTapped))
        
        toolbar.setItems([cancelButton, spacerButton, doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        
        self.toolbar = toolbar
    }
    
    @objc func doneTapped() {
        self.toolbarDelegate?.didTapDone(self)
    }
    
    @objc func cancelTapped() {
        self.toolbarDelegate?.didTapCancel(self)
    }
    
}
