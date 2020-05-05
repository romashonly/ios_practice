//
//  DoneChallengeInteractor.swift
//  WinsIOSPractice
//
//  Created by Роман Шуркин on 05.05.2020.
//  Copyright © 2020 Hope To. All rights reserved.
//

import Foundation

class DoneChallengeInteractor {
    weak var output: DoneChallengeInteractorOutput!
    
    func getChallenges(){
        let challenges = DataManager._shared.doneChallenges
        self.output.configureView(with: challenges)
    }
}
