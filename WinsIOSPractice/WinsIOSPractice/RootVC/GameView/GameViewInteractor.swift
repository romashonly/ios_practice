//
//  GameViewInteractor.swift
//  WinsIOSPractice
//
//  Created by Роман Шуркин on 05.05.2020.
//  Copyright © 2020 Hope To. All rights reserved.
//

import Foundation

class GameViewInteractor{
    weak var output: GameViewInteractorOutput!
    
    func startConfigure(){
        let actulChallenge = DataManager._shared.actualChallenges
        let allTricks = DataManager._shared.skateTricks
        let tenTrick = GameViewInteractor.rundomTrick(tricks: allTricks, maxNumber: 10)//Написть логику
        self.output.configure(with: tenTrick, actulChallenge)
    }
    
    static func rundomTrick(tricks: [Trick], maxNumber:Int = 10) -> [Trick]{
        var tri = tricks
        var tricksForGame = [Trick]()
        for _ in 1...maxNumber{
            let i = Int.random(in: 0..<tri.count)
            let trick = tri[i]
            tri.remove(at: i)
            tricksForGame.append(trick)
        }
        return tricksForGame
    }
}

extension GameViewInteractor: GameViewInteractorInput{
    func saveChanges(of trick: Trick, with dif: Float, and stab: Int) {
        DataManager._shared.saveTrick(trick: trick, stab: stab, dif: dif)
    }
    
    func isChallengeDone(_ challenge: Challenge, done: Bool) {
        DataManager._shared.saveChallenge(challenge)
    }
    
    func recountTechnocalSkill() {
        let allTricks = DataManager._shared.skateTricks
        let doneTrick = allTricks.filter{$0.tries >= 1}
        var donesDif: Float = 0
        doneTrick.forEach{donesDif += $0.complexity}
        
        var allDif: Float = 0
        allTricks.forEach{allDif += $0.complexity}
        
        let techSkill = donesDif / allDif
        
        DataManager._shared.saveTechnikalSkill(techSkill)
    }
    
    
}
