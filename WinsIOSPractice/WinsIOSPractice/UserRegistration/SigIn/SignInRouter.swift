//
//  SignInRouter.swift
//  WinsIOSPractice
//
//  Created by Роман Шуркин on 05.05.2020.
//  Copyright © 2020 Hope To. All rights reserved.
//

import UIKit

class SignInRouter: SignInRouterInput {
    
    
    func signIn() {
        
        let viewController = RootVCRegAssembly.configureModule()
        let navigationViewController = UINavigationController(rootViewController: viewController)
        
        UIApplication.shared.windows.first?.rootViewController = navigationViewController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    func nextVc() {
        SportsRegVC.show(parent: self.view)
    }
    
    weak var view: SignInVIewController!
    
    func showSignAlert(text: String) {
        let alert = UIAlertController(title: "Error", message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Try again", style: .default, handler: nil))
        view.present(alert, animated: true, completion: nil)
    }
}
