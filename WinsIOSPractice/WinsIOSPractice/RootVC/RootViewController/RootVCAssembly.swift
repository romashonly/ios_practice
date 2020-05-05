//
//  RootVCAssembly.swift
//  WinsIOSPractice
//
//  Created by Роман Шуркин on 05.05.2020.
//  Copyright © 2020 Hope To. All rights reserved.
//

class RootVCRegAssembly {
    class func configureModule() -> RootViewController{
        let view = RootViewController._shared
        
        let presenter = RootVCPresentor()
        let interactor = RootVCInteractor()
        let router = RootVCRouter()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        router.view = view
        interactor.output = presenter
        view.output = presenter
        view.headerView.output = presenter
        interactor.locationManager = LocationManager(delegate: interactor)
        
        interactor.startConfigure()
        
        return view
    }
}
