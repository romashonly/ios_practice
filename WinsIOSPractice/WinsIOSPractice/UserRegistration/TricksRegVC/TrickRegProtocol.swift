//
//  TrickRegProtocol.swift
//  WinsIOSPractice
//
//  Created by Роман Шуркин on 05.05.2020.
//  Copyright © 2020 Hope To. All rights reserved.
//

import UIKit

protocol TrickRegViewOutput: class {
    func enRegistration()
    func saveChangedTrick(with trick: Trick,_ newDif: Float,_ newStab: Int)
}

protocol TrickRegInteractorlInput: class {
    func saveUserData(with trick: Trick,_ newDif: Float,_ newStab: Int)
}

protocol TricckRegInteractorOutput: class {
    func configure(with model: [Trick])
}

protocol TrickRegViewInput: class {
    func setUpUI(with tricks: [Trick])
}

protocol TrickRegRouterInput: class {
    func endRegistration()
}
