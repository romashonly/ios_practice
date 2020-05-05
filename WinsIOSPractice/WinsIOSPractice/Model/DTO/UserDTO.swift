//
//  UserDTO.swift
//  Wins
//
//  Created by Роман Шуркин on 05.05.2020.
//  Copyright © 2020 Hope To. All rights reserved.
//

import Foundation

struct UserDTO: Codable {
    
    var login: String? = nil
    var password: String? = nil
    var id: String = UUID().uuidString
    
    var name: String = "Guest"
    var city: String? = nil
    var age: Int = 0
    
    var facebook: String = ""
    var instagram: String = ""
    var vkontakte: String = ""
    
    var skateTrick = [TrickDTO]()
    var scootTrick = [TrickDTO]()
    var bmxTrick = [TrickDTO]()
    
    var challenges = [ChallengeDTO]()
    
    var avatarImageData: Data? = nil
    
    var standIsRegular: Bool = true
    
    var totalStats: TotalStatsDTO?
    var doneChallenges = [ChallengeDTO]()
}
