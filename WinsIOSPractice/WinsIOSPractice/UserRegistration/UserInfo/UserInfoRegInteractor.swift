//
//  UserInfoRegInteractor.swift
//  WinsIOSPractice
//
//  Created by Роман Шуркин on 05.05.2020.
//  Copyright © 2020 Hope To. All rights reserved.
//

import Foundation
import UIKit

class UserInfoRegInteractor {
    
    var user: User? = nil
    
    weak var output: UserInfoRegInteractorProtocolOutput!
    
    func getUserData() {
        
        self.user = DataManager._shared.user
        guard let user = self.user else { return }
        self.output.configureView(with: user)
    }
}

extension UserInfoRegInteractor: UserInfoRegInteractorProtocolInput {
    func saveUserData(with name: String, city: String, age: String, isReg: Bool) {
        
        let dataMng = DataManager._shared
        
        dataMng.saveName(name)
        dataMng.saveCity(city )
        dataMng.saveAge(Int(age) ?? 0)
        dataMng.saveStand(isReg)
    }
    
    func setUserImage(image: UIImage) {
        DataManager._shared.saveImage(image)
    }
}

