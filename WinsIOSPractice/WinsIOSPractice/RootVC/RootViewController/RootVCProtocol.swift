//
//  RootVCProtocol.swift
//  WinsIOSPractice
//
//  Created by Роман Шуркин on 05.05.2020.
//  Copyright © 2020 Hope To. All rights reserved.
//

protocol RootViewInpit: class {
    func configure(with model: User?, _ chalenges: [Challenge], and lastTenTrick: [Trick])
    func reload(with chalanges: [Challenge])
    func reload(with lastTenTrick: [Trick])
    func reload(with user: User)
}

protocol RootViewOutput: class{
    //router
    func goToSettings()
    func goToReg()
    func goToDoneChallenge()
    
    func showGameView()
    
    //reloadMetods
}

protocol RootInteractorOutput: class{
    func configure(with model: User?,_ chalenges: [Challenge], and lastTenTrick: [Trick])
    
    func reload(with chalanges: [Challenge])
    func reload(with lastTenTrick: [Trick])
    func reload(with user: User)
}

protocol RootRouterInput: class{
    func goToSettings()
    func goToReg()
    func goToDoneChallenge()
    
    func showGameView()
}

protocol RootInteractorInput {
    func getLastTenTricks() -> [Trick]
    func getUser() -> User
    func getChallenges() -> [Challenge]
}


