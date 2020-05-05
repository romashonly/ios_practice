//
//  RootVCPresentor.swift
//  WinsIOSPractice
//
//  Created by Роман Шуркин on 05.05.2020.
//  Copyright © 2020 Hope To. All rights reserved.
//

class RootVCPresentor{
    weak var view: RootViewInpit!
    var router: RootRouterInput!
    var interactor: RootInteractorInput!
}


extension RootVCPresentor: RootViewOutput{
    //MARK: Router metods
    
    func goToReg() {
        self.router.goToReg()
    }
    
    func goToSettings() {
        self.router.goToSettings()
    }
    
    func goToDoneChallenge() {
        self.router.goToDoneChallenge()
    }
    
    func showGameView() {
        self.router.showGameView()
    }
    
}

//MARK: Configure
extension RootVCPresentor: RootInteractorOutput{
    func reload(with chalanges: [Challenge]) {
        self.view.reload(with: chalanges)
    }
    
    func reload(with lastTenTrick: [Trick]) {
        self.view.reload(with: lastTenTrick)
    }
    
    func reload(with user: User) {
        self.view.reload(with: user)
    }
    
    func configure(with model: User?, _ chalenges: [Challenge], and lastTenTrick: [Trick]) {
        if model != nil{
            self.view.configure(with: model, chalenges, and: lastTenTrick)
        } else{
            self.goToReg()
        }
    }
}
