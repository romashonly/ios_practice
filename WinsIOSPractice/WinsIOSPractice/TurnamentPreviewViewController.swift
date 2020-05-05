//
//  TurnamentPreviewViewController.swift
//  WinsIOSPractice
//
//  Created by Роман Шуркин on 05.05.2020.
//  Copyright © 2020 Hope To. All rights reserved.
//

import UIKit

class TurnamentPreviewViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.view.backgroundColor =  UIColor(red: 0.11, green: 0.11, blue: 0.11, alpha: 1)
        
        let label = UILabel()
        self.view.addSubview(label)
        label.text = "In the next release"
        label.font = UIFont.systemFont(ofSize: 36)
        label.textColor = .white
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 60).isActive  = true
        label.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 33).isActive = true
        
        let textLabel = UILabel()

        self.view.addSubview(textLabel)
        textLabel.font = UIFont.systemFont(ofSize: 20)
        textLabel.textColor = .white
        
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 33).isActive = true
        textLabel.topAnchor.constraint(equalTo: label.topAnchor, constant: 34).isActive = true
        textLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -33).isActive = true
        textLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -70).isActive = true

        textLabel.lineBreakMode = .byWordWrapping
        textLabel.numberOfLines = 4

        textLabel.text = "Soon we will add the ability to organize GOS through video communication. You have good internet, we have rival for you! So, we will create viedo chat for you and your parnter and you can play so long so you want "
    }
    
}
