//
//  StatisticPresentor.swift
//  WinsIOSPractice
//
//  Created by Роман Шуркин on 05.05.2020.
//  Copyright © 2020 Hope To. All rights reserved.
//

import Foundation

class StatisticPresentor {
    weak var view: StatViewInput!
}

extension StatisticPresentor: StatInteractorOutput {
    func configure(with tricks: [Trick]) {
        self.view.configure(with: tricks)
    }
}
