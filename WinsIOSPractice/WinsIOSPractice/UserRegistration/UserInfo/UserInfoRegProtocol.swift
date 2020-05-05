//
//  UserInfoRegProtocol.swift
//  WinsIOSPractice
//
//  Created by Роман Шуркин on 05.05.2020.
//  Copyright © 2020 Hope To. All rights reserved.
//

import Foundation
import UIKit

protocol UserInfoRegInteractorProtocolInput: class {
    func saveUserData(with name: String, city: String, age: String, isReg: Bool)
    func setUserImage(image: UIImage)
}

protocol UserInfoRegInteractorProtocolOutput: class {
    func getUserData()
    func configureView(with user: User)
}

protocol UserInfoRegViewProtocolInput: class {
    func setUp()
    func configureView(with user: User)
}

protocol UserInfoRegViewProtocolOutput: class {
    func openNextStep()
    func openPhotoPicker()
    
    func openSportVC()
    
    func openCameraPicker()
    
    func setUserImage(image: UIImage)
    
    func openAlert(alert: UIAlertController)
    
    func saveUserData(with name: String, city: String, age: String, isReg: Bool)
}

protocol UserInfoRegRouterProtocolInput: class {
    func closeCurrentViewController()
    func openNextStep()
    func openPhotoPicker()
    func openSportVC()
    
    func openCameraPicker()
    
    func endRegistration()
    
    func openAlert(alert: UIAlertController)
}



