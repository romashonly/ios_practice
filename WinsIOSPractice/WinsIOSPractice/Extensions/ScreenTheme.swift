//
//  ScreenTheme.swift
//  WinsIOSPractice
//
//  Created by Роман Шуркин on 05.05.2020.
//  Copyright © 2020 Hope To. All rights reserved.
//

import Foundation
import UIKit

struct ScreenTheme {
    
    static var isXFormat: Bool {
        return UIScreen.main.bounds.height / UIScreen.main.bounds.width >= 896.0 / 414.0
    }
}
