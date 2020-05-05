//
//  SportRegPresentor.swift
//  WinsIOSPractice
//
//  Created by Роман Шуркин on 05.05.2020.
//  Copyright © 2020 Hope To. All rights reserved.
//
import UIKit

class SportRegPresentor {
//    func sportIsSelected(with type: SportsRegVC.SportType) {
//        self.interactor.saveUserData()
//        self.router.nextView()
//    }
    
    var interactor: SportRegInteractorProtocolInput!
    
    var router: SportRegRouterProtocolInput!
    
    weak var view: SportRegViewProtocolInput!
        
}

extension SportRegPresentor: SportRegViewProtocolOutput {
    
    func showAlert(alert: UIAlertController) {
        self.router.showAlert(alert: alert)
    }
    
    func sportIsSelected(with type: SportType) {
        
        self.interactor.saveUserData(with: type)
        
        if self.view.isUser {
            self.router.dismiss()
        } else {
            self.router.nextView()
        }
    }
}

extension SportRegPresentor: SportRegInteractorProtocolOutput {
    func configure(with sportType: SportType, isUser: Bool) {
        self.view.setUP()
        let isUser = sportType != .none ? isUser : false
        self.view.configure(with: sportType, and: isUser)
    }
}
