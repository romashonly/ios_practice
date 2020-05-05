//
//  GameViewRouter.swift
//  WinsIOSPractice
//
//  Created by Роман Шуркин on 05.05.2020.
//  Copyright © 2020 Hope To. All rights reserved.
//

import Foundation
import UIKit

class GameRouter {
    weak var view: GameView!
}

extension GameRouter: GameViewRouterInput {
    func showSpeechInfo() {
        let infoPopVC = SpeechInfoViewController()
        infoPopVC.modalPresentationStyle = .popover
        
        let popoverVC = infoPopVC.popoverPresentationController
        popoverVC?.delegate = self.view as? UIPopoverPresentationControllerDelegate
        popoverVC?.sourceView = self.view.infoBtn
        popoverVC?.sourceRect = CGRect(x: self.view.infoBtn.bounds.midX, y: self.view.infoBtn.bounds.maxY, width: 0, height: 0)
        infoPopVC.preferredContentSize = CGSize(width: 250, height: 250)
        RootViewController._shared.present(infoPopVC, animated: true, completion: nil)
    }
}
