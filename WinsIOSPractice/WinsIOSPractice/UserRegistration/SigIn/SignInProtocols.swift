//
//  SignInProtocols.swift
//  WinsIOSPractice
//
//  Created by Роман Шуркин on 05.05.2020.
//  Copyright © 2020 Hope To. All rights reserved.
//

import Foundation

internal protocol SignInViewInput: class {
    func setUp()
}

internal protocol SignInViewOutput:class {
    func createUser(login: String, password: String)
    func nextVC()
    func signIn()
    func showSignAlert(text: String)
}

internal protocol SignInRouterInput:class {
    func nextVc()
    func signIn()
    func showSignAlert(text: String)
}

internal protocol SignInInteractorInput:class {
    func createUser(login: String, password: String)
}
