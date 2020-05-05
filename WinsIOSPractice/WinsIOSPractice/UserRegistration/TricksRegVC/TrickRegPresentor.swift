//
//  TrickRegPresentor.swift
//  WinsIOSPractice
//
//  Created by Роман Шуркин on 05.05.2020.
//  Copyright © 2020 Hope To. All rights reserved.
//

import Foundation

class TrickRegPresentor {
    
    var interactor: TrickRegInteractorlInput!
    var router: TrickRegRouterInput!
    weak var view: TrickRegViewInput!
}

extension TrickRegPresentor: TrickRegViewOutput { 
    
    func saveChangedTrick(with trick: Trick, _ newDif: Float, _ newStab: Int) {
        self.interactor.saveUserData(with: trick, newDif, newStab)
    }
    
    func enRegistration() {
        self.router.endRegistration()
    }
}

extension TrickRegPresentor: TricckRegInteractorOutput{
    func configure(with model: [Trick]) {
        self.view.setUpUI(with: model)
    }
}
