//
//  DoneChallengePresentor.swift
//  WinsIOSPractice
//
//  Created by Роман Шуркин on 05.05.2020.
//  Copyright © 2020 Hope To. All rights reserved.
//

import Foundation

class DoneChallengePresentor {
    weak var view: DoneChallengeViewInput!
    var router: DoneChallengeRouterInput!
    
}

import UIKit
extension DoneChallengePresentor: DoneChallemgeViewOutput {
    func goBack() {
        self.router.goBack()
    }
    
    func showPromocode(with alert: UIAlertController) {
        self.router.showPromocode(with: alert)
    }
}

extension DoneChallengePresentor: DoneChallengeInteractorOutput {
    func configureView(with challenges: [Challenge]) {
        self.view.configureView(with: challenges)
    }
}
