//
//  TrickDTO.swift
//  Wins
//
//  Created by Роман Шуркин on 05.05.2020.
//  Copyright © 2020 Hope To. All rights reserved.
//

import Foundation

struct TrickDTO: Codable {
    
   var id: String
   var name: String
   var complexity: Float
   var stability: Int
   var tries: Int
}
