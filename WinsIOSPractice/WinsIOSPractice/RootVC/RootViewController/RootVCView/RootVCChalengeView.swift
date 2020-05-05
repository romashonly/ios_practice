//
//  RootVCChalengeView.swift
//  WinsIOSPractice
//
//  Created by Роман Шуркин on 05.05.2020.
//  Copyright © 2020 Hope To. All rights reserved.
//

import UIKit

extension RootViewController:  UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.challenges.filter{!$0.isDone}.count 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChalendgeCell", for: indexPath) as? ChalendgeCell
        cell!.configure(with: self.challenges[indexPath.row])
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //guard !(DataManager._shared.user?.chalenges[indexPath.row].isChalenge ?? true) else { return }
        if indexPath.row == 1{
            let view = TurnamentPreviewViewController()
            self.present(view, animated: true, completion: nil)
        }
        //открываем страицу с турнирами
    }
}

extension RootViewController: UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 280, height: 135)
    }
}

extension RootViewController{
    class ChalendgeCell: UICollectionViewCell{
        private var mainLabel = UILabel()
        private var backgoundImage = UIImageView()
        private var sponspor = UILabel()
        private var date = UILabel()
        let sponsporLabel = UILabel()
        let dateLabel = UILabel()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            self.setUp()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func setUp(){
            self.addSubview(self.backgoundImage)
            self.backgoundImage.translatesAutoresizingMaskIntoConstraints = false
            self.backgoundImage.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
            self.backgoundImage.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
            self.backgoundImage.topAnchor.constraint(equalTo: self.topAnchor).isActive  = true
            self.backgoundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            
            self.addSubview(self.mainLabel)
            self.mainLabel.translatesAutoresizingMaskIntoConstraints = false
            self.mainLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 33).isActive = true
            self.mainLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant:  -33).isActive = true
            self.mainLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 26).isActive = true
            self.mainLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -67).isActive = true
            
            self.mainLabel.textColor = .white
            self.mainLabel.font = UIFont.systemFont(ofSize: 15)
            self.mainLabel.lineBreakMode = .byWordWrapping
            self.mainLabel.numberOfLines = 2
            self.mainLabel.minimumScaleFactor = 0.5
            
           
            self.addSubview(self.sponsporLabel)
            self.sponsporLabel.translatesAutoresizingMaskIntoConstraints = false
            self.sponsporLabel.leftAnchor.constraint(equalTo: self.mainLabel.leftAnchor).isActive = true
            self.sponsporLabel.topAnchor.constraint(equalTo: self.mainLabel.bottomAnchor, constant: 26).isActive = true
            
            self.sponsporLabel.text = "Sponsor"
            self.sponsporLabel.textColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1)
            self.sponsporLabel.font = UIFont.systemFont(ofSize: 10)
            
            self.addSubview(self.sponspor)
            self.sponspor.translatesAutoresizingMaskIntoConstraints = false
            self.sponspor.leftAnchor.constraint(equalTo: self.sponsporLabel.leftAnchor).isActive = true
            self.sponspor.topAnchor.constraint(equalTo: self.sponsporLabel.bottomAnchor, constant: 5).isActive = true
            
            self.sponspor.textColor = .white
            self.sponspor.font = UIFont.systemFont(ofSize: 12)
            
            
            self.addSubview(self.date)
            self.date.translatesAutoresizingMaskIntoConstraints = false
            self.date.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -33).isActive = true
            self.date.topAnchor.constraint(equalTo: self.sponspor.topAnchor).isActive = true
            
            self.date.textColor = .white
            self.date.font = UIFont.systemFont(ofSize: 12)
            
            
            self.addSubview(self.dateLabel)
            self.dateLabel.translatesAutoresizingMaskIntoConstraints = false
            self.dateLabel.topAnchor.constraint(equalTo: self.sponsporLabel.topAnchor).isActive = true
            self.dateLabel.leftAnchor.constraint(equalTo: self.date.leftAnchor).isActive = true
            
            self.dateLabel.text = "Date"
            self.dateLabel.textColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1)
            self.dateLabel.font = UIFont.systemFont(ofSize: 10)
        }
        
        func configure(with chalenge: Challenge){
            
            let formatter = DateFormatter()
            formatter.dateFormat = "dd:MM:yyyy"
            let myStringafd = formatter.string(from: chalenge.startDate)
            
            if chalenge.isChallenge{
                self.mainLabel.text =  "Today's lucky trick - \n\(chalenge.trick!.name)"
                self.sponspor.text = chalenge.boardShop
                self.date.text = myStringafd
            }else{
                self.mainLabel.text = "Turnament"
                self.sponspor.text = ""
                self.date.text = ""
                self.sponsporLabel.isHidden = true
                self.dateLabel.isHidden = true
            }
        
            if let imageData = chalenge.sponsorImageData, let image = UIImage(data: imageData){
                self.backgoundImage.image = image
            }else{
                self.backgoundImage.image = SportType.skate.image
            }
        }
    }
}


