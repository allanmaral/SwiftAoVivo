//
//  LGLabel.swift
//  Login
//
//  Created by Allan Amaral on 13/07/22.
//

import UIKit

class LGLabel: UILabel {
    
    init(text: String) {
        super.init(frame: .zero)
        self.text = text
        
        initDefault()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initDefault() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = .systemFont(ofSize: Constants.labelFontSize)
        self.textColor = .labelTextColor
        self.textAlignment = .left
    }
}
