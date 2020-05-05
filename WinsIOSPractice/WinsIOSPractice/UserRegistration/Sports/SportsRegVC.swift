//
//  SportsRegVC.swift
//  WinsIOSPractice
//
//  Created by Роман Шуркин on 05.05.2020.
//  Copyright © 2020 Hope To. All rights reserved.
//

import UIKit

class SportsRegVC: UIViewController {
    
    //----------------------------------------------------------------------
    
    var output: SportRegViewProtocolOutput!
    
    var complition: (() -> ())? = nil
    
    var sportType: SportType = .skate
    
    //----------------------------------------------------------------------
    
    var header: RegHeaderView!
    
    //----------------------------------------------------------------------
    
    var isUser: Bool = false {
        didSet{
            self.header.isHidden = self.isUser
        }
    }
    
    //----------------------------------------------------------------------
    
    static func show(parent: UIViewController, and complition: (() -> ())? = nil) {
        let vc = SportRegAssembly.configureModule()
        vc.complition = complition
        parent.present(vc, animated: true, completion: nil)
    }
    
    //----------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //----------------------------------------------------------------------
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    //----------------------------------------------------------------------
    
}

extension SportsRegVC: SportRegViewProtocolInput {
    func configure(with type: SportType, and isUser: Bool) {
        
        self.sportType = type
        self.isUser = isUser
    }
    
    func setUP() {
        
        self.header = RegHeaderView(step: .sport, parentView: self.view)
        
        self.view.backgroundColor = UIColor(red: 0.11, green: 0.11, blue: 0.11, alpha: 1)
        
        let skate = SportBtn(type: .skate, presentor: self.output)
        self.view.addSubview(skate)
        skate.translatesAutoresizingMaskIntoConstraints = false
        skate.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 38).isActive = true
        skate.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -33).isActive = true
        skate.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 33).isActive = true
        
        let scoot = SportBtn(type: .scoot, presentor: self.output)
        self.view.addSubview(scoot)
        scoot.translatesAutoresizingMaskIntoConstraints = false
        scoot.topAnchor.constraint(equalTo: skate.bottomAnchor, constant: 38).isActive = true
        scoot.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -33).isActive = true
        scoot.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 33).isActive = true
        
        let bmx = SportBtn(type: .bmx, presentor: self.output)
        self.view.addSubview(bmx)
        bmx.translatesAutoresizingMaskIntoConstraints = false
        bmx.topAnchor.constraint(equalTo: scoot.bottomAnchor, constant: 38).isActive = true
        bmx.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -33).isActive = true
        bmx.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 33).isActive = true
        
    }
}

extension SportsRegVC {
    class SportBtn: UIView {
    
        var presentor: SportRegViewProtocolOutput!
        var type: SportType!
        
        init(type: SportType, presentor: SportRegViewProtocolOutput) {
            super.init(frame: .zero)
            
            self.type = type
            self.presentor = presentor
            
            let btn = UIButton()
            let title = UILabel()
            
            self.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 129/309).isActive = true
            
            self.addSubview(btn)
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
            btn.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
            btn.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            btn.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            
            btn.setImage(type.image, for: [])
            btn.layer.cornerRadius = 6
            
            btn.addTarget(self, action: #selector(self.sportIsSelected), for: .touchUpInside)
            
            addSubview(title)
            title.translatesAutoresizingMaskIntoConstraints = false
            title.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            title.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 23).isActive = true
            
            title.font = UIFont.systemFont(ofSize: 20)
            title.textColor = .white
            title.text = type.text
        }
        
        @objc func sportIsSelected() {
            guard self.type == .skate else {
                let alert = UIAlertController(title: "In developing", message: "You can choose skateboarding", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.presentor.showAlert(alert: alert)
                return
            }
            self.presentor.sportIsSelected(with: self.type)
        }
        
        override init(frame: CGRect) {
            super.init(frame: frame)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        
    }
}
