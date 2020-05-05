//
//  TotalStatsDTO.swift
//  Wins
//
//  Created by Роман Шуркин on 05.05.2020.
//  Copyright © 2020 Hope To. All rights reserved.
//

import Foundation

struct TotalStatsDTO: Codable {
   var id: String
   
   var technicality: Float
   var stability: Float
   var percentageTricksLearned: Float
}
