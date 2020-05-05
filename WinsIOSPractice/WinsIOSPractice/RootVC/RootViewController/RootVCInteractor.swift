//
//  RootVCInteractor.swift
//  WinsIOSPractice
//
//  Created by Роман Шуркин on 05.05.2020.
//  Copyright © 2020 Hope To. All rights reserved.
//

import Foundation


class RootVCInteractor{
    weak var output: RootInteractorOutput!
    
    var locationManager:LocationManager!
    
    var locationKey = ""
    
    func getUserData(){
        self.locationManager.setUp()
        let user = self.getUser()
        let challenges = self.getChallenges()
        let lastTricks = self.getLastTenTricks()
        self.output.configure(with: user, challenges, and: lastTricks)
    }
    
    func startConfigure(){
        self.getUserData()
        self.addNotification()
    }
    
    func addNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(reloadData), name: NSNotification.Name(rawValue: "gameViewWillRemove"), object: nil)
    }
    
    @objc func reloadData(){
        self.output.reload(with: self.getChallenges())
        self.output.reload(with: self.getLastTenTricks())
        self.output.reload(with: self.getUser())
    }
    
}
extension RootVCInteractor: RootInteractorInput{
    func challengeDone(challenge: Challenge) {
        DataManager._shared.saveChallenge(challenge)
    }
    
    func getUser() -> User {
        
        let user = DataManager._shared.user!
        
        return user
    }
    
    func getChallenges() -> [Challenge]{
        let chalanges = DataManager._shared.actualChallenges
        return chalanges
    }
    
    func getLastTenTricks() -> [Trick] {
        let user = self.getUser()
        var lastTenTrick = DataManager._shared.lastTenTrick
        if lastTenTrick.isEmpty{
            let tricks = user.skateTrick 
            lastTenTrick = GameViewInteractor.rundomTrick(tricks: Array(tricks))
            var lastTenTrickID = [String]()
            lastTenTrick.forEach { (trick) in
                lastTenTrickID.append(trick.name)
            }
            UserDefaults.standard.set(lastTenTrickID, forKey: USRDefKeys.lastTenTrick)
        }
        return lastTenTrick
    }
    
    func saveTrick(_ trick: Trick, with stab: Int, and dif: Float) {
        var arrTricks = DataManager._shared.lastTenTrick
        arrTricks.removeFirst()
        arrTricks.append(trick)
        DataManager._shared.lastTenTrick = arrTricks
        DataManager._shared.saveTrick(trick: trick, stab: stab, dif: dif)
    }
}

extension RootVCInteractor: LocationDelegate{
    func someError(error: Error?) {
        print(error!)
    }
    
    func updateLocation(with region: String?) {
        if locationKey != region{
            self.locationKey = region ?? "Moscow"
            
            //читаем данные с сервера
        }
    }
}


