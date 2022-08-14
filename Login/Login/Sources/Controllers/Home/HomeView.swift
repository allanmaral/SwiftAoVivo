//
//  HomeView.swift
//  Login
//
//  Created by Allan Amaral on 08/08/22.
//

import UIKit

class HomeView: LGView {
    
    // MARK: - Visual Elements
    lazy var logoImageView: UIImageView = {
        var imageView = UIImageView(image: UIImage(named: "Logo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    // MARK: - Setup Visual Elements
    override func setupVisualElements() {
        super.setupVisualElements()
        
        setupImageView()
    }
    
    private func setupImageView() {
        contentView.addSubview(logoImageView)
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Spacing.small),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    // MARK: - Public Methods
    
    func setUserData(userProfileViewModel: UserProfileViewModel) {
        
    }
    
}
