//
//  HomeViewController.swift
//  Login
//
//  Created by Allan Amaral on 08/08/22.
//

import UIKit

class HomeViewController: LGViewController {
    
    // MARK: - View
    lazy var homeView: HomeView = {
        let view = HomeView()
        
        return view
    }()
    
    override func loadView() {
        super.loadView()
        
        self.view = homeView
        self.title = LocalizableStrings.home.localize()
    }
    
    // MARK: - Public Funcs
    
    func setUserData(userProfileViewModel: UserProfileViewModel) {
        homeView.setUserData(userProfileViewModel: userProfileViewModel)
    }
}
