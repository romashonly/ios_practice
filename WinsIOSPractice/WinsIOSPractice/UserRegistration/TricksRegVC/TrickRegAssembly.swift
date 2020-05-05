//
//  TrickRegConfigurator.swift
//  WinsIOSPractice
//
//  Created by Роман Шуркин on 05.05.2020.
//  Copyright © 2020 Hope To. All rights reserved.
//

import UIKit

class TrickRegAssembly {
    class func configureModule() -> TricksRegVC {
        
        let view = TricksRegVC()
        
        let presenter = TrickRegPresentor()
        let interactor = TrickRegInteractor()
        let router = TrickRegRouter()
        
        view.output = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        router.view = view
        interactor.output = presenter
        
        interactor.getUserData()
        
        return view
    }
}
