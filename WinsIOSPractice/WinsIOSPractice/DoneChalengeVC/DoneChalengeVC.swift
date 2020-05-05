//
//  DoneChalengeVC.swift
//  WinsIOSPractice
//
//  Created by Роман Шуркин on 05.05.2020.
//  Copyright © 2020 Hope To. All rights reserved.
//

import UIKit

class DoneChallengeVC: UIViewController {
    
    static func show(parent: UIViewController) {
        let vc = DoneChallengeAssembly.configureModule()
        parent.navigationController?.pushViewController(vc, animated: true)
    }
    
    var output: DoneChallemgeViewOutput!
    
    private var doneChallange = [Challenge]()
    private var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        self.setUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func setUp() {
        self.navigationController?.navigationBar.isHidden = false
        self.title = "Your's done challange"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let backLabel = UIButton()
        backLabel.setImage(UIImage(named: "BackIcon"), for: [])
        backLabel.addTarget(self, action: #selector(self.goBack), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backLabel)
        
        
        self.collectionView.backgroundColor = .red
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 5
        
        self.collectionView.collectionViewLayout = flowLayout
        self.collectionView.backgroundColor = UIColor(red: 0.11, green: 0.11, blue: 0.11, alpha: 1)
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.showsVerticalScrollIndicator = false
        self.collectionView.contentInset = UIEdgeInsets(top: 33, left: 20, bottom: 0, right: 33)
        
        self.view.addSubview(self.collectionView)
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        self.collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.collectionView.register(DoneChallengeCell.self, forCellWithReuseIdentifier: "DoneChallengeCell")
        self.collectionView.register(EmptyChallengeCell.self, forCellWithReuseIdentifier: "EmptyChallengeCell")
            
    }
    
    @objc func goBack() {
        self.output.goBack()
    }
    
}

extension DoneChallengeVC: DoneChallengeViewInput {
    func configureView(with challenges: [Challenge]) {
        self.doneChallange = challenges
        self.collectionView.reloadData()
    }
}

extension DoneChallengeVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let defaultNumber = Int(self.view.frame.height / 67) * 2
        return self.doneChallange.count < defaultNumber ? defaultNumber - self.doneChallange.count: self.doneChallange.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if !self.doneChallange.isEmpty, self.doneChallange.count - 1 >= indexPath.row{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DoneChallengeCell", for: indexPath) as? DoneChallengeCell
            cell!.configure(with: self.doneChallange[indexPath.row])
            return cell!
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EmptyChallengeCell", for: indexPath) as? EmptyChallengeCell
            return cell!
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //FIXME: VIPER
        let alert = UIAlertController(title: "Promocode", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Coppy", style: .default, handler: { (_) in
            UIPasteboard.general.string = "Hello world"
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension DoneChallengeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.view.frame.size.width - 20 - 33 - 5) / 2
        return CGSize(width: width, height: 67.5)
    }
}

extension DoneChallengeVC {
    class EmptyChallengeCell: UICollectionViewCell {
        
        private var backGroundImageView = UIImageView()
        private var borderView = UIView()
        private var blur = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        private var label = UILabel()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            self.setUp()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setUp() {
            self.addSubview(self.backGroundImageView)
            self.backGroundImageView.translatesAutoresizingMaskIntoConstraints = false
            self.backGroundImageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
            self.backGroundImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
            self.backGroundImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive  = true
            self.backGroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            
            self.backGroundImageView.layer.cornerRadius = 6
            let sportString = UserDefaults.standard.value(forKey: USRDefKeys.sportType) as? String ?? "Skate"
            let sportType = SportType(rawValue: sportString)
            self.backGroundImageView.image = sportType?.image
            
            self.addSubview(self.blur)
            self.blur.translatesAutoresizingMaskIntoConstraints = false
            self.blur.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
            self.blur.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
            self.blur.topAnchor.constraint(equalTo: self.topAnchor).isActive  = true
            self.blur.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            
            self.addSubview(self.borderView)
            self.borderView.translatesAutoresizingMaskIntoConstraints = false
            self.borderView.topAnchor.constraint(equalTo: self.topAnchor, constant: 3).isActive = true
            self.borderView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 3).isActive = true
            self.borderView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -3).isActive = true
            self.borderView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -3).isActive = true
            
            self.borderView.layer.cornerRadius = 6
            self.borderView.layer.borderColor = UIColor.white.cgColor
            self.borderView.layer.borderWidth = 1
            
            self.addSubview(self.label)
            self.label.translatesAutoresizingMaskIntoConstraints = false
            self.label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            self.label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            self.label.heightAnchor.constraint(equalToConstant: 15).isActive = true
            self.label.widthAnchor.constraint(equalToConstant: 95).isActive = true
            
            self.label.textColor = .lightGray
            self.label.font = UIFont.systemFont(ofSize: 12)
            
            self.label.text = "Chalange"
            
        }
    }
}

extension DoneChallengeVC {
    class DoneChallengeCell: UICollectionViewCell {
        
        private var trickLabel = UILabel()
        private var boardShop = UILabel()
        private var dateLabel = UILabel()
        private var backgroundImge = UIImageView()
        
        private var borderView = UIView()
        
        func setUp() {
            self.addSubview(self.backgroundImge)
            self.backgroundImge.translatesAutoresizingMaskIntoConstraints = false
            self.backgroundImge.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
            self.backgroundImge.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
            self.backgroundImge.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            self.backgroundImge.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            
            self.backgroundImge.layer.cornerRadius = 6
            self.backgroundImge.image = UIImage(named: "Registration/Sports/Skate")
            
            self.addSubview(self.boardShop)
            self.boardShop.translatesAutoresizingMaskIntoConstraints = false
            self.boardShop.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 11).isActive = true
            self.boardShop.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            
            self.boardShop.text = "Nike sb"
            self.boardShop.font = UIFont.systemFont(ofSize: 12)
            
            self.addSubview(self.trickLabel)
            self.trickLabel.translatesAutoresizingMaskIntoConstraints = false
            self.trickLabel.leftAnchor.constraint(equalTo: self.boardShop.leftAnchor).isActive = true
            self.trickLabel.bottomAnchor.constraint(equalTo: self.boardShop.topAnchor, constant: -4).isActive = true
            
            self.trickLabel.textColor = .white
            self.trickLabel.font = UIFont.systemFont(ofSize: 14)
            self.trickLabel.text = "Kickflip"
            
            self.addSubview(self.dateLabel)
            self.dateLabel.translatesAutoresizingMaskIntoConstraints = false
            self.dateLabel.topAnchor.constraint(equalTo: self.boardShop.bottomAnchor, constant: 4).isActive = true
            self.dateLabel.leftAnchor.constraint(equalTo: self.trickLabel.leftAnchor).isActive = true
            
            self.dateLabel.text = "Date"
            self.dateLabel.font = UIFont.systemFont(ofSize: 12)
            
            self.addSubview(self.borderView)
            self.borderView.translatesAutoresizingMaskIntoConstraints = false
            self.borderView.topAnchor.constraint(equalTo: self.topAnchor, constant: 3).isActive = true
            self.borderView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 3).isActive = true
            self.borderView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -3).isActive = true
            self.borderView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -3).isActive = true
            
            self.borderView.layer.cornerRadius = 6
            self.borderView.layer.borderColor = UIColor.white.cgColor
            self.borderView.layer.borderWidth = 1
        }
        
        fileprivate func configure(with doneChallenge: Challenge) {
            self.trickLabel.text = doneChallenge.trick?.name
            self.dateLabel.text = doneChallenge.startDate.string
        }
        
        override init(frame: CGRect) {
            super.init(frame: .zero)
            self.setUp()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}
