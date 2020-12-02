//
//  LoginViewController.swift
//  Trafel
//
//  Created by Yauheni Kozich on 28.11.20.
//

import UIKit
import MBProgressHUD

class LoginViewController: UIViewController {
    
    var delegate: OnboardingDelegate?
    private var isSuccessfulLogin = true
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passConfirmationTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var forgetPasswordButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    private enum PageType {
        case login
        case signUp
    }
    private var errorMessage: String? {
        didSet {
           showErrorMessageIfNeeded(text: errorMessage)
        }
    }
    private var currentPageType: PageType = .login {
        didSet {
           setupViewsFor(pageType: currentPageType)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewsFor(pageType: .login)
    }
    private func setupViewsFor(pageType: PageType) {
        errorLabel.text = nil
        passConfirmationTextField.isHidden = pageType == .login
        signUpButton.isHidden = pageType == .login
        forgetPasswordButton.isHidden = pageType == .signUp
        loginButton.isHidden = pageType == .signUp
    }
    private func showErrorMessageIfNeeded(text: String?) {
        errorLabel.isHidden = text == nil
        errorLabel.text = text
    }
    @IBAction func forgetPasswordButtonTapped(_ sender: Any) {
    }
    @IBAction func signUpButtonTapped(_ sender: Any) {
    }
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        MBProgressHUD.showAdded(to: view, animated: true)
        delay(durationInSeconds: 2.0) {
            MBProgressHUD.hide(for: self.view, animated: true)
            if self.isSuccessfulLogin {
                self.delegate?.showMainTabBarController()
            } else {
                self.errorMessage = "You passwod is invalid. Please try again."
            }
        }
        
    }
    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
        currentPageType = sender.selectedSegmentIndex == 0 ? .login : .signUp
    }
}
