//
//  RegHeaderView.swift
//  WinsIOSPractice
//
//  Created by Роман Шуркин on 05.05.2020.
//  Copyright © 2020 Hope To. All rights reserved.
//

import UIKit

class RegHeaderView: UIView {
    
    private var cross = UILabel()
    private var steps = UILabel()
    private var progressBar = UIProgressView()
    private var titleVC = UILabel()

    private var stepLeftAnchor: NSLayoutConstraint? = nil
    
    var stepsType: Steps = .sport
    var parentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(step: Steps, parentView: UIView) {
        super.init(frame: .zero)
        self.parentView = parentView
        self.setUp()
        self.configure(step: step)
    }
    
    internal var title: String = "" {
        didSet {
            self.titleVC.text = self.title
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        
        self.parentView.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(self.cross)
        self.backgroundColor = UIColor(red: 0.11, green: 0.11, blue: 0.11, alpha: 1)
        self.rightAnchor.constraint(equalTo: self.parentView.rightAnchor, constant: 0).isActive = true
        self.leftAnchor.constraint(equalTo: self.parentView.leftAnchor, constant: 0).isActive = true
        self.topAnchor.constraint(equalTo: self.parentView.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true

        self.cross.translatesAutoresizingMaskIntoConstraints = false
        self.cross.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 33).isActive = true
        self.cross.topAnchor.constraint(equalTo: self.topAnchor, constant: 30).isActive = true
        self.cross.widthAnchor.constraint(equalToConstant: 20).isActive = true
        self.cross.heightAnchor.constraint(equalTo: self.cross.widthAnchor).isActive = true

        self.cross.text = "+"
        self.cross.font = UIFont.systemFont(ofSize: 30)
        self.cross.textColor = .white

        self.cross.transform = CGAffineTransform(rotationAngle: .pi / 4)

        self.addSubview(self.steps)
        self.addSubview(self.progressBar)
        self.steps.translatesAutoresizingMaskIntoConstraints = false
        self.stepLeftAnchor = self.steps.leftAnchor.constraint(equalTo: self.cross.rightAnchor, constant: 39)
        self.stepLeftAnchor?.isActive = true

        self.steps.rightAnchor.constraint(equalTo: self.progressBar.leftAnchor, constant: -10).isActive = true
        self.steps.centerYAnchor.constraint(equalTo: self.cross.centerYAnchor).isActive = true

        self.steps.textColor = UIColor(red: 0.314, green: 0.314, blue: 0.314, alpha: 1)
        self.steps.font = UIFont.systemFont(ofSize: 14)


        self.progressBar.translatesAutoresizingMaskIntoConstraints = false
        self.progressBar.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        self.progressBar.centerYAnchor.constraint(equalTo: self.cross.centerYAnchor).isActive = true
        self.progressBar.widthAnchor.constraint(greaterThanOrEqualToConstant: 220).isActive = true

        self.progressBar.progressTintColor = UIColor(red: 0.129, green: 0.31, blue: 0.937, alpha: 1)

        self.addSubview(self.titleVC)
        self.titleVC.translatesAutoresizingMaskIntoConstraints = false
        self.titleVC.topAnchor.constraint(equalTo: self.cross.bottomAnchor, constant: 31).isActive = true
        self.titleVC.leftAnchor.constraint(equalTo: self.cross.leftAnchor).isActive = true
        self.titleVC.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -33).isActive = true
        
        self.bottomAnchor.constraint(equalTo: self.titleVC.bottomAnchor).isActive = true
    
        self.titleVC.font = UIFont.systemFont(ofSize: 36)
        self.titleVC.textColor = .white

        self.titleVC.lineBreakMode = .byWordWrapping
        self.titleVC.numberOfLines = 2

    }

    func configure(step: Steps) {
        
        self.steps.text = step.text
        self.progressBar.progress = step.rawValue
        self.titleVC.text = step.title
        if step == .sport{
            self.stepLeftAnchor?.isActive = false
            self.steps.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 33).isActive = true
            self.cross.isHidden = true
        }
    }
}


enum Steps: Float, CaseIterable {
    
    case sighIn = 0
    case sport = 0.33
    case userInfo = 0.66
    case tricks = 1.0

    var text: String {
        return "шаг \(Int(self.rawValue / 0.33))/3"
    }

    var title: String {
        switch self {
        case .sighIn:
            return "Registration"//"Регистрация"
        case .sport:
            return "Kind of sport"//"Вид спорта"
        case .userInfo:
            return "Enter your data"//"Введите данные"
        case .tricks:
            return "What tricks do you know?"//"Какие трюки умеешь?"
        }
    }
}
