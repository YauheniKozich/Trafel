//
//  LoadingViewController.swift
//  Trafel
//
//  Created by Yauheni Kozich on 21.11.20.
//

import UIKit


class LoadingViewController: UIViewController {
    
    private let isUserLoggedIn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        delay(durationInSeconds: 2.0) {
            self.showInitialsView()
        }
            
    }
    
    private func showInitialsView() {
        if isUserLoggedIn {
            PresenterManager.shared.show(vc: .mainTabBarController)
        } else {
            performSegue(withIdentifier: Segue.showOnboardingScreen.rawValue, sender: nil)
        }
    }
}
