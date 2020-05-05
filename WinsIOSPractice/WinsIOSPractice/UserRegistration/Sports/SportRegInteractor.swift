//
//  SportRegInteractor.swift
//  WinsIOSPractice
//
//  Created by Роман Шуркин on 05.05.2020.
//  Copyright © 2020 Hope To. All rights reserved.
//
import Foundation

class SportRegInteractor{
        
    weak var output: SportRegInteractorProtocolOutput!
    
    func getData(){
        
        let isUser = self.isUser()
        let sportType = self.getUserSport()
        
        self.output.configure(with: sportType, isUser: isUser)
    }
    
    func isUser() -> Bool {
        
        let user = DataManager._shared.user
        
        if user == nil {
            return false
        } else {
            return true
        }
    }
    
    func getUserSport() -> SportType {
        guard let sportTypeValue = UserDefaults.standard.value(forKey: USRDefKeys.sportType) as? String, let type = SportType(rawValue: sportTypeValue) else { return .none}
        return type
    }
    
}

extension SportRegInteractor: SportRegInteractorProtocolInput {
    func saveUserData(with type: SportType) {
        
        if DataManager._shared.user != nil {
            UserDefaults.standard.set(type.rawValue, forKey: USRDefKeys.sportType)
            _ = DataManager._shared.createSkateTricks()
        } else {
            self.saveData()
        }
        DataManager._shared.addDefaultChalenge()
    }

    func saveData() {
        DataManager._shared.createUser(login: nil, password: nil, sportType: .skate)
    }
    
}
