//
//  SportRegRouter.swift
//  WinsIOSPractice
//
//  Created by Роман Шуркин on 05.05.2020.
//  Copyright © 2020 Hope To. All rights reserved.
//
import UIKit

class SportRegRouter {
    
    weak var view: SportsRegVC!
}

extension SportRegRouter: SportRegRouterProtocolInput {
    
    func showAlert(alert: UIAlertController) {
        self.view.present(alert, animated: true, completion: nil)
    }
    
    func dismiss() {
        self.view.dismiss(animated: true, completion: nil)
    }
    
    func nextView() {
        UserInfoRegistrationVC.show(parent: view)
    }
    
    func endRegistration() {
 
    }
    
}
