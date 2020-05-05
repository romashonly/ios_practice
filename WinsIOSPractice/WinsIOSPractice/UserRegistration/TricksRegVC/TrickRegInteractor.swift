//
//  TrickRegInteractor.swift
//  WinsIOSPractice
//
//  Created by Роман Шуркин on 05.05.2020.
//  Copyright © 2020 Hope To. All rights reserved.
//

import Foundation

class TrickRegInteractor{
    
    weak var output: TricckRegInteractorOutput!
    
    func getUserData() {
        let trick = DataManager._shared.skateTricks
        self.output.configure(with: Array(trick))
    }
}

extension TrickRegInteractor: TrickRegInteractorlInput {
    
    func saveUserData(with trick: Trick, _ newDif: Float, _ newStab: Int) {
        DataManager._shared.saveTrick(trick: trick, stab: newStab, dif: newDif)
    }
}
