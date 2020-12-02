//
//  PresenterManager.swift
//  Trafel
//
//  Created by Yauheni Kozich on 23.11.20.
//

import UIKit

class PresenterManager {
    static let shared = PresenterManager()
    
    private init() {}
    
    enum VC {
        case mainTabBarController
        case onboarding
    }
    func show(vc: VC) {
        var viewController: UIViewController
        
        switch vc {
        case .mainTabBarController:
            viewController = UIStoryboard(name: StoriboardId.main.rawValue, bundle: nil).instantiateViewController(identifier: StoriboardId.mainTabBarController.rawValue)
        case .onboarding:
            viewController = UIStoryboard(name: StoriboardId.main.rawValue, bundle: nil).instantiateViewController(identifier: StoriboardId.onboardingViewController.rawValue)
        }
        if  let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate, let window = sceneDelegate.window {
            window.rootViewController = viewController
            
            UIView.transition(with: window, duration: 0.25, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
    }
}
