//
//  UsersTricksRegVC.swift
//  WinsIOSPractice
//
//  Created by Роман Шуркин on 05.05.2020.
//  Copyright © 2020 Hope To. All rights reserved.
//

import UIKit

class TricksRegVC: UIViewController {
    
    var output: TrickRegViewOutput!
    
    var stackView = UIStackView()
    var nextVcBtn = UIButton()
    
    var tricks = [Trick]()
    
    static func show(parent:UIViewController) {
        let nextStepVC = TrickRegAssembly.configureModule()
        parent.present(nextStepVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension TricksRegVC: TrickRegViewInput {
    
    func setUpUI(with tricks: [Trick]) {
        
        let header = RegHeaderView(step: .tricks, parentView: self.view)
        self.tricks = tricks
        
        self.view.backgroundColor = UIColor(red: 0.11, green: 0.11, blue: 0.11, alpha: 1)
        
        self.view.addSubview(self.stackView)
        self.view.addSubview(self.nextVcBtn)
        
        self.nextVcBtn.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.stackView.leftAnchor.constraint(equalTo: self.view.leftAnchor,constant:  33).isActive = true
        self.stackView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -33).isActive = true
        self.stackView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 40).isActive = true
        self.stackView.bottomAnchor.constraint(greaterThanOrEqualTo: self.nextVcBtn.topAnchor, constant:  -40).isActive = true
        
        self.stackView.axis = .vertical
        self.stackView.alignment = .center
        self.stackView.distribution = .equalCentering
        self.stackView.spacing = 20
        
        self.nextVcBtn.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -33).isActive = true
        self.nextVcBtn.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant:  33).isActive = true
        self.nextVcBtn.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        self.nextVcBtn.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        self.nextVcBtn.backgroundColor = UIColor(red: 0.131, green: 0.309, blue: 0.939, alpha: 1)
        self.nextVcBtn.layer.cornerRadius = 6
        
        self.nextVcBtn.setTitle("Next", for: .normal)
        self.nextVcBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        
        self.nextVcBtn.addTarget(self, action: #selector(self.nextVC), for: .touchUpInside)
        
        self.view.layoutIfNeeded()
        
        let tircksNumber = Int((self.stackView.frame.height) / 80)
        
        self.addTrics(number: tircksNumber)
    }
    
    func addTrics(number: Int) {
        
        let tricks = GameViewInteractor.rundomTrick(tricks: self.tricks, maxNumber: number-1)
        
        for i in 0..<number - 1 {
            let trick =  tricks[i]
            let view = TricksRegVC.CheckBoxView(trick: trick, output: self.output)
            self.stackView.addArrangedSubview(view)
            view.rightAnchor.constraint(equalTo: self.stackView.rightAnchor).isActive = true
            view.leftAnchor.constraint(equalTo: self.stackView.leftAnchor).isActive = true
        }
    }
    
    @objc func nextVC() {
        self.output.enRegistration()
    }
}

extension TricksRegVC{
    
    class CheckBoxView: UIView {
        
        private let box = UIView()
        private let label = UILabel()
        private let cross = UIView()
        
        private var trick: Trick? = nil
        private var defaultDif: Float? = nil
        
        private var newDif: Float = 0.0
        private var newStab = 0
        
        private var output: TrickRegViewOutput!
        
        var isSelect: Bool = false {
            didSet {
                self.cross.isHidden = !self.isSelect
                self.label.textColor = self.isSelect ? .white : UIColor(red: 0.314, green: 0.314, blue: 0.314, alpha: 1)
                self.newDif  = self.isSelect ? self.trick!.complexity - 3 : self.defaultDif!
                self.newStab = self.isSelect ? self.trick!.stability + 5 : 0
                self.output.saveChangedTrick(with: trick!, self.newDif, self.newStab)
            }
        }
        
        func setUp(with name: String) {
            
            self.layer.borderColor = UIColor(red: 0.314, green: 0.314, blue: 0.314, alpha: 1).cgColor
            self.layer.borderWidth = 1
            self.layer.cornerRadius = 6
            self.heightAnchor.constraint(equalToConstant: 60).isActive = true
            
            self.addSubview(self.box)
            self.box.translatesAutoresizingMaskIntoConstraints = false
            self.box.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            self.box.leftAnchor.constraint(equalTo: self.leftAnchor, constant:  20).isActive = true
            self.box.heightAnchor.constraint(equalToConstant: 22).isActive = true
            self.box.widthAnchor.constraint(equalTo: self.box.heightAnchor).isActive = true
            
            self.box.layer.borderColor = UIColor(red: 0.314, green: 0.314, blue: 0.314, alpha: 1).cgColor
            self.box.layer.borderWidth = 1
            self.box.layer.cornerRadius = 6
            
            self.addSubview(self.label)
            self.label.translatesAutoresizingMaskIntoConstraints = false
            self.label.centerYAnchor.constraint(equalTo: self.box.centerYAnchor).isActive = true
            self.label.leftAnchor.constraint(equalTo: self.box.rightAnchor, constant: 10).isActive = true
            
            self.label.font = UIFont.systemFont(ofSize: 18)
            self.label.textColor = UIColor(red: 0.314, green: 0.314, blue: 0.314, alpha: 1)
            
            self.label.text = name
            
            let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.isTaped))
            self.addGestureRecognizer(tapRecognizer)
            
            self.addSubview(self.cross)
            self.cross.translatesAutoresizingMaskIntoConstraints = false
            self.cross.centerYAnchor.constraint(equalTo: self.box.centerYAnchor).isActive = true
            self.cross.centerXAnchor.constraint(equalTo: self.box.centerXAnchor).isActive = true
            self.cross.heightAnchor.constraint(equalTo: self.box.heightAnchor).isActive = true
            self.cross.widthAnchor.constraint(equalTo: self.box.widthAnchor).isActive = true

            func addCrossPart(crossPart: UIView, rotate: CGFloat) {
                self.cross.addSubview(crossPart)
                crossPart.translatesAutoresizingMaskIntoConstraints = false
                crossPart.centerXAnchor.constraint(equalTo: self.cross.centerXAnchor).isActive = true
                crossPart.centerYAnchor.constraint(equalTo: self.cross.centerYAnchor).isActive  = true
                crossPart.heightAnchor.constraint(equalTo: self.cross.heightAnchor, constant: -2).isActive = true
                crossPart.widthAnchor.constraint(equalToConstant: 2).isActive = true
                
                crossPart.backgroundColor = UIColor(red: 0.129, green: 0.31, blue: 0.937, alpha: 1)
                
                crossPart.transform = CGAffineTransform(rotationAngle: rotate)
            }
            
            let crosPart1 = UIView()
            let crosPart2 = UIView()
            
            addCrossPart(crossPart: crosPart1, rotate: CGFloat.pi / 4)
            addCrossPart(crossPart: crosPart2, rotate: -(CGFloat.pi / 4))
            
            self.cross.isHidden = true
        }
        
        @objc func isTaped() {
            self.isSelect = !self.isSelect
        }
        
        init(trick: Trick, output: TrickRegViewOutput) {
            super.init(frame: CGRect.zero)
            self.output = output
            self.trick = trick
            self.defaultDif = trick.complexity
            self.setUp(with: trick.name)
        }
        
        override init(frame: CGRect) {
            super.init(frame: frame)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}

