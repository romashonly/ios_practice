//
//  DoneChallengeProtocols.swift
//  WinsIOSPractice
//
//  Created by Роман Шуркин on 05.05.2020.
//  Copyright © 2020 Hope To. All rights reserved.
//

import UIKit

protocol DoneChallengeViewInput: class {
    func configureView(with challenges: [Challenge])
}

protocol DoneChallemgeViewOutput: class {
    func showPromocode(with alert: UIAlertController)
    
    func goBack()
}

protocol DoneChallengeInteractorOutput: class {
    func configureView(with challenges: [Challenge])
}

protocol DoneChallengeRouterInput: class {
    func showPromocode(with alert: UIAlertController)
    func goBack()
}
