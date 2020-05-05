//
//  RootVCRouter.swift
//  WinsIOSPractice
//
//  Created by Роман Шуркин on 05.05.2020.
//  Copyright © 2020 Hope To. All rights reserved.
//

import Foundation

class RootVCRouter{
    weak var view: RootViewController!
}

extension RootVCRouter: RootRouterInput{
    func showGameView() {
        let gameView = GameViewAssembly.configureModule(with: self.view.view.frame)
        gameView.controller = self.view
        self.view.view.addSubview(gameView)
        
    }
    
    func goToDoneChallenge() {
        DoneChallengeVC.show(parent: view)
    }
    
    func goToReg() {
        SportsRegVC.show(parent: RootViewController._shared)
    }
    
    func goToSettings() {
        UserInfoRegistrationVC.show(parent: self.view)
    }
}
