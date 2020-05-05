//
//  DoneChallengeAssembly.swift
//  WinsIOSPractice
//
//  Created by Роман Шуркин on 05.05.2020.
//  Copyright © 2020 Hope To. All rights reserved.
//

import Foundation


class DoneChallengeAssembly {
    class func configureModule() -> DoneChallengeVC {
        let view = DoneChallengeVC()
        
        let presentor = DoneChallengePresentor()
        let interactor = DoneChallengeInteractor()
        let router = DoneChallengeRouter()
        
        view.output = presentor
        
        presentor.view = view
        presentor.router = router
        
        router.view = view
        
        interactor.output = presentor
        interactor.getChallenges()
        
        return view
    }
}
