//
//  LGTextField.swift
//  Login
//
//  Created by Allan Amaral on 14/07/22.
//

import UIKit

class LGTextField: UITextField {
    
    private struct Constants {
        static let horizontalPadding = Spacing.medium
        static let verticalPadding = Spacing.medium
        static let cornerRadius = CornerRadius.medium
        static let borderWidthDefault: CGFloat = 1
        static let borderWidthActive: CGFloat = 2
    }
    
    let borderLayer = CALayer()
    
    convenience init(placeholder: String) {
        self.init(placeholder: placeholder, font: .input, keyboardType: .default, returnKeyType: .done)
    }
    
    convenience init(placeholder: String, keyboardType: UIKeyboardType, returnKeyType: UIReturnKeyType) {
        self.init(placeholder: placeholder, font: .input, keyboardType: keyboardType, returnKeyType: returnKeyType)
    }

    init(placeholder: String, font: UIFont, keyboardType: UIKeyboardType, returnKeyType: UIReturnKeyType) {
        self.hasError = false
        super.init(frame: .zero)
        
        self.placeholder = placeholder
        self.font = font
        self.keyboardType = keyboardType
        self.returnKeyType = returnKeyType
        
        initDefault()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initDefault() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clearButtonMode = .whileEditing
    }
    
    override var placeholder: String? {
        didSet {
            if let placeholder = placeholder {
                let placeholderString = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.inputPlaceholder])
                self.attributedPlaceholder = placeholderString
            } else {
                self.attributedPlaceholder = nil
            }
        }
    }
    
    var hasError: Bool {
        didSet {
            updateBorder()
        }
    }
    
    // MARK: - Draw border
    
    private func updateBorder() {
        borderLayer.frame = bounds
        borderLayer.borderWidth = isFirstResponder ? Constants.borderWidthActive : Constants.borderWidthDefault
        borderLayer.borderColor = borderColor()
        borderLayer.backgroundColor = UIColor.inputBackground.cgColor
        borderLayer.cornerRadius = Constants.cornerRadius
    }
    
    private func borderColor() -> CGColor {
        if hasError {
            return UIColor.red.cgColor
        } else if isFirstResponder {
            return UIColor.primary.cgColor
        } else {
            return UIColor.inputBorder.cgColor
        }
    }
    
    // MARK: - Overrides
    
    override func draw(_ rect: CGRect) {
        updateBorder()
        layer.insertSublayer(borderLayer, at: 0)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(
            x: bounds.origin.x + Constants.horizontalPadding,
            y: bounds.origin.y + Constants.verticalPadding,
            width: bounds.size.width - Constants.horizontalPadding * 2,
            height: bounds.size.height - Constants.verticalPadding * 2
        )
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return self.textRect(forBounds: bounds)
    }
    
    // MARK: - UITextField Observing
    
    override func willMove(toSuperview newSuperview: UIView!) {
        if newSuperview != nil {
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(textFieldDidEndEditing),
                                                   name: UITextField.textDidEndEditingNotification,
                                                   object: self)
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(textFieldDidBeginEditing),
                                                   name: UITextField.textDidBeginEditingNotification,
                                                   object: self)
        } else {
            NotificationCenter.default.removeObserver(self)
        }
    }
    
    /// The textfield has started an editing session.
    @objc func textFieldDidBeginEditing() {
        animateViews()
    }
    
    /// The textfield has ended an editing session.
    @objc func textFieldDidEndEditing() {
        animateViews()
    }
    
    /// Trigger the animation after entering or leaving the editing state.
    private func animateViews() {
        UIView.animate(withDuration: 0.3, animations: {
            self.updateBorder()
        })
    }

}
