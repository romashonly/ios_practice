//
//  NetworkManager.swift
//  WinsIOSPractice
//
//  Created by Роман Шуркин on 05.05.2020.
//  Copyright © 2020 Роман Шуркин. All rights reserved.
//

import Foundation
import Alamofire

protocol NetworkManagerProtocol {
    
    func getUser(id: String, completion: @escaping(User) -> Void)
    
    func saveUser(user: UserDTO)
    
}

class NetworkManager: NetworkManagerProtocol {
    
    let domen = "http://localhost"
    
    static var _shared = NetworkManager()
    
    private init() {
//        NotificationCenter.default.addObserver(self, selector: #selector(update), name: UIApplication.willResignActiveNotification, object: nil)
    }
    
    @objc func update() {
//        NetworkManager._shared.saveUser(user: (DataManager._shared.user!.dto as! UserDTO))
    }
    
    func getUser(id: String, completion: @escaping(User) -> Void) {
        
        let urlString = domen + "/users/" + "\(id)"
        
        AF.request(urlString).responseDecodable(of: User.self) { response in
            
            var user: User?
            
            switch response.result {
            case .success(_):
                user = response.value
                completion(user!)
            case .failure(_):
                print("User is nil")
            }
        }
    }
    
    func saveUser(user: UserDTO) {
        
        let urlString = domen + "/users"
        
        var user = user
        
        user.challenges = [ChallengeDTO]()
        
        AF.request(urlString, method: .post, parameters: user, encoder: JSONParameterEncoder.default, headers: ["Content-Type" : "application/json"]).responseString { response in
            switch response.result {
            case .success(_):
                print("good")
            case .failure(_):
                print("error")
            }
        }
    }
    
}
