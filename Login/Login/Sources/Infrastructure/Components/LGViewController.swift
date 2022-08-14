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
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    private func unregisterKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func adjustForKeyboard(notification: Notification) {
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }

        let keyboardScreenEndFrame = keyboardValue.cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)

        if notification.name == UIResponder.keyboardWillHideNotification {
            keyboardWillHide()
        } else {
            keyboardWillAppear(keyboardViewEndFrame.height)
        }
    }
    
    func keyboardWillAppear(_ keyboardHeight: CGFloat) {
        guard let scrollView = scrollView else { return }
        let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight - view.safeAreaInsets.bottom, right: 0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }

    func keyboardWillHide() {
        guard let scrollView = scrollView else { return }
        scrollView.contentInset = .zero
        scrollView.scrollIndicatorInsets = .zero
    }
    
}
