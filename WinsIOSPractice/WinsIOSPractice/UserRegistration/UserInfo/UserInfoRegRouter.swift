//
//  UserInfoRegRouter.swift
//  WinsIOSPractice
//
//  Created by Роман Шуркин on 05.05.2020.
//  Copyright © 2020 Hope To. All rights reserved.
//

import Foundation

class UserInfoRegRouter{
    
    weak var view: UserInfoRegistrationVC!
}

import UIKit
extension UserInfoRegRouter: UserInfoRegRouterProtocolInput {
    func openAlert(alert: UIAlertController) {
        self.view.present(alert, animated: true, completion: nil)
    }
    
    func closeCurrentViewController() {
        //        self.viewController.sportRegRouter?.endRegistration()
    }
    
    func openNextStep() {
        TricksRegVC.show(parent: self.view)
    }
    
    func endRegistration() {
        //        self.viewController.sportRegRouter?.endRegistration()
    }
    
    func openPhotoPicker() {
        //UserInfoImagePickerVC.show(parent: self.view)
        self.view.showImagePicker()
    }
    
    func openCameraPicker() {
        self.view.showCameraPicker()
    }
    
    func openSportVC() {
        SportsRegVC.show(parent: self.view)
    }
    
}

