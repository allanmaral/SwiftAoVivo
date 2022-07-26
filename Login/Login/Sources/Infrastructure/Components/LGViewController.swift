//
//  LGViewController.swift
//  Login
//
//  Created by Allan Amaral on 18/07/22.
//

import UIKit

class LGViewController: UIViewController {
    var scrollView: UIScrollView? {
        guard let view = self.view as? LGView else { return nil }
        return view.scrollView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupClickOutside()
        
        navigationItem.largeTitleDisplayMode = .never
    }
    
    // MARK: - Click Outside
    
    func setupClickOutside() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewDidTappedOutside))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func viewDidTappedOutside() {
        self.view.endEditing(true)
    }
    
    // MARK: - Keyboard Events
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unregisterKeyboardNotifications()
    }
    
    private func registerKeyboardNotifications() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) {
            [weak self] notification in
            guard let keyboardInfo = notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue else { return }
            let keyboardSize = keyboardInfo.cgRectValue.height
            self?.keyboardWillAppear(keyboardSize)
        }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) {
            [weak self] notification in
            self?.keyboardWillHide()
        }
    }
    
    private func unregisterKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self)
    }
    
    func keyboardWillAppear(_ keyboardHeight: CGFloat) {
        guard let scrollView = scrollView else { return }
        let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    func keyboardWillHide() {
        guard let scrollView = scrollView else { return }
        scrollView.contentInset = .zero
        scrollView.scrollIndicatorInsets = .zero
    }
    
}
