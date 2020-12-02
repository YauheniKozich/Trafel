//
//  SettingViewController.swift
//  Trafel
//
//  Created by Yauheni Kozich on 23.11.20.
//

import UIKit
import MBProgressHUD

class SettingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
    }
    
    private func setupViews() {
        view.backgroundColor = .red
    }
    
    @IBAction func logoutButtonTapped(_ sender: UIBarButtonItem ) {
        MBProgressHUD.showAdded(to: view, animated: true)
        delay(durationInSeconds: 0.5) {
            MBProgressHUD.hide(for: self.view, animated: true)
            PresenterManager.shared.show(vc: .onboarding)
        }
       
    }
}
