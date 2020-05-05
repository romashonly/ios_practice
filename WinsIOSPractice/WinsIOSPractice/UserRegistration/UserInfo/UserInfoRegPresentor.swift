//
//  UserInfoRegPresentor.swift
//  WinsIOSPractice
//
//  Created by Роман Шуркин on 05.05.2020.
//  Copyright © 2020 Hope To. All rights reserved.
//


class UserInfoRegPresentor {
    weak var view: UserInfoRegViewProtocolInput!
    var router: UserInfoRegRouterProtocolInput!
    var interactor: UserInfoRegInteractorProtocolInput!
}

import UIKit
extension UserInfoRegPresentor: UserInfoRegViewProtocolOutput {
    
    func saveUserData(with name: String, city: String, age: String, isReg: Bool) {
        self.interactor.saveUserData(with: name, city: city, age: age, isReg: isReg)
    }
    
    func openAlert(alert: UIAlertController) {
        self.router.openAlert(alert: alert)
    }
    
    func openSportVC() {
        self.router.openSportVC()
    }
    
    
    func openNextStep() {
        self.router.openNextStep()
    }
    
    func openPhotoPicker() {
        self.router.openPhotoPicker()
    }

    func openCameraPicker() {
        self.router.openCameraPicker()
    }
    
    func setUserImage(image: UIImage) {
        self.interactor.setUserImage(image: image)
    }
    
}

extension UserInfoRegPresentor: UserInfoRegInteractorProtocolOutput{
    
    func configureView(with user: User) {
        self.view.configureView(with: user)
    }
    
    func getUserData(){
        
    }
}
