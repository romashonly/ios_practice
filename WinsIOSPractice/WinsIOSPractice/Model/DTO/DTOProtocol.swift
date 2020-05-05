//
//  DTOProtocol.swift
//  Wins
//
//  Created by Роман Шуркин on 05.05.2020.
//  Copyright © 2020 Hope To. All rights reserved.
//

import Foundation

protocol DTOProtocol: Codable {
    var dto: Any { get }
}
