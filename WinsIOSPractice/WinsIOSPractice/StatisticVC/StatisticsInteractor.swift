//
//  StatisticsInteractor.swift
//  WinsIOSPractice
//
//  Created by Роман Шуркин on 05.05.2020.
//  Copyright © 2020 Hope To. All rights reserved.
//

import Foundation

class StatisticInteractor {
    
    weak var output: StatInteractorOutput!
    
    func getTricks() {
        
        let tricks = DataManager._shared.skateTricks
        let arrOfTricks = Array(tricks)
        
        self.output.configure(with: arrOfTricks)
    }
}
