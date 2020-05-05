//
//  SportRegProtocol.swift
//  WinsIOSPractice
//
//  Created by Роман Шуркин on 05.05.2020.
//  Copyright © 2020 Hope To. All rights reserved.
//


import UIKit
 internal protocol SportRegInteractorProtocolOutput:class {
    func configure(with sportType: SportType, isUser: Bool)
}

internal protocol SportRegInteractorProtocolInput: class {
    func saveUserData(with type: SportType)
}

internal protocol SportRegViewProtocolInput: class {
    func setUP()
    func configure(with type: SportType,and isUser: Bool)
    var isUser: Bool { get set }
}

internal protocol SportRegViewProtocolOutput: class {
    func sportIsSelected(with type: SportType)
    func showAlert(alert: UIAlertController)
}


internal protocol SportRegRouterProtocolInput: class {
    func nextView()
    func endRegistration()
    func dismiss()
    func showAlert(alert: UIAlertController)
}
