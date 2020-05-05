//
//  StatisticProtocol.swift
//  WinsIOSPractice
//
//  Created by Роман Шуркин on 05.05.2020.
//  Copyright © 2020 Hope To. All rights reserved.
//

import UIKit

protocol StatViewInput: class {
    func configure(with tricks: [Trick])
}

protocol StatInteractorOutput: class {
    func configure(with tricks: [Trick])
}
