//
//  SignInPresentor.swift
//  WinsIOSPractice
//
//  Created by Роман Шуркин on 05.05.2020.
//  Copyright © 2020 Hope To. All rights reserved.
//

import Foundation

class SignInPresentor {
    weak var view: SignInViewInput!
    var router: SignInRouterInput!
    var interactor: SignInInteractorInput!
    
    func setUpView() {
        self.view.setUp()
    }
    
}

extension SignInPresentor: SignInViewOutput {
    func showSignAlert(text: String) {
        self.router.showSignAlert(text: text)
    }
    
    func signIn() {
        self.router.signIn()
    }
    
    func createUser(login: String, password: String) {
        self.interactor.createUser(login: login, password: password)
    }
    
    func nextVC() {
        self.router.nextVc()
    }
}
