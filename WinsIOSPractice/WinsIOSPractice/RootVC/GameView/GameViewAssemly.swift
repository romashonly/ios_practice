//
//  GameViewAssemly.swift
//  WinsIOSPractice
//
//  Created by Роман Шуркин on 05.05.2020.
//  Copyright © 2020 Hope To. All rights reserved.
//

import UIKit

class GameViewAssembly{
    class func configureModule(with frame: CGRect) -> GameView{
        let view = GameView(frame: frame)
        
        let presentor = GameViewPresentor()
        let interactor = GameViewInteractor()
        let router = GameRouter()
        
        view.output = presentor
        interactor.output = presentor
        presentor.router = router
        
        router.view = view
        
        presentor.view = view
        presentor.interactor = interactor
        
        interactor.startConfigure()
        
        return view
    }
    
    func showInfoPopover() {
        
    }
}
