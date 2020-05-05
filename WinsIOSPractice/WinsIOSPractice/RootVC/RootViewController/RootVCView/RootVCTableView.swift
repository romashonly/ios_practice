//
//  RootVCTableView.swift
//  WinsIOSPractice
//
//  Created by Роман Шуркин on 05.05.2020.
//  Copyright © 2020 Hope To. All rights reserved.
//

import UIKit

extension RootViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard section != 0 else { return 0}
        return self.lastTenTricks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StatTableViewCell", for: indexPath) as! StatTableViewCell
         let trick = self.lastTenTricks[indexPath.row]
        cell.configure(with: trick, isSelect: self.selectedIndex.contains(indexPath))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! StatTableViewCell
        
        cell.isSelect = !cell.isSelect
        if cell.isSelect{
            self.selectedIndex.append(indexPath)
            
        }else{
            guard let index = self.selectedIndex.firstIndex(of: indexPath) else { return }
            self.selectedIndex.remove(at: index)
        }
        
        tableView.beginUpdates()
        tableView.endUpdates()
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0{
            let contentView = UIView()
            
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.scrollDirection = .horizontal
            self.chalengeView.collectionViewLayout = flowLayout
            self.chalengeView.backgroundColor = UIColor(red: 0.11, green: 0.11, blue: 0.11, alpha: 1)
            self.chalengeView.showsHorizontalScrollIndicator = false
            self.chalengeView.showsVerticalScrollIndicator = false
            self.chalengeView.contentInset = UIEdgeInsets(top: 0, left: 33, bottom: 0, right: 33)
            
            contentView.addSubview(self.chalengeView)
            self.chalengeView.translatesAutoresizingMaskIntoConstraints = false
            self.chalengeView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
            self.chalengeView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
            self.chalengeView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
            self.chalengeView.heightAnchor.constraint(equalToConstant: 135).isActive = true
            
            self.chalengeView.collectionViewLayout = flowLayout
            self.chalengeView.backgroundColor = UIColor(red: 0.11, green: 0.11, blue: 0.11, alpha: 1)
            self.chalengeView.showsHorizontalScrollIndicator = false
            self.chalengeView.showsVerticalScrollIndicator = false
            self.chalengeView.contentInset = UIEdgeInsets(top: 0, left: 33, bottom: 0, right: 33)
            
            self.chalengeView.delegate = self
            self.chalengeView.dataSource = self
            
            self.chalengeView.register(ChalendgeCell.self, forCellWithReuseIdentifier: "ChalendgeCell")
            
            contentView.addSubview(self.statBtn)
            self.statBtn.translatesAutoresizingMaskIntoConstraints = false
            self.statBtn.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
            self.statBtn.rightAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
            self.statBtn.topAnchor.constraint(equalTo: self.chalengeView.bottomAnchor, constant: 42).isActive = true
            self.statBtn.heightAnchor.constraint(equalToConstant: 112).isActive = true

            self.statBtn.setImage(UIImage(named:"Menu/stat"), for: [])
            
            self.statBtn.addTarget(self, action: #selector(self.goToStatiscits), for: .touchUpInside)
            
            let statLabel = UILabel()
            contentView.addSubview(statLabel)
            statLabel.translatesAutoresizingMaskIntoConstraints = false
            statLabel.centerXAnchor.constraint(equalTo: self.statBtn.centerXAnchor).isActive = true
            statLabel.centerYAnchor.constraint(equalTo: self.statBtn.centerYAnchor).isActive = true
            
            statLabel.text = "Statistics"
            statLabel.textColor = .white
            statLabel.font  = UIFont.systemFont(ofSize: 20)
            
            contentView.addSubview(self.gameBtn)
            self.gameBtn.translatesAutoresizingMaskIntoConstraints = false
            self.gameBtn.topAnchor.constraint(equalTo: self.statBtn.topAnchor).isActive = true
            self.gameBtn.bottomAnchor.constraint(equalTo: self.statBtn.bottomAnchor).isActive = true
            self.gameBtn.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
            self.gameBtn.leftAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true

            self.gameBtn.setImage(UIImage(named:"Menu/game"), for: .normal)
            
            self.gameBtn.addTarget(self, action: #selector(self.goToGame), for: .touchUpInside)
            
            let gameTitle = UILabel()
            contentView.addSubview(gameTitle)
            gameTitle.translatesAutoresizingMaskIntoConstraints = false
            gameTitle.centerYAnchor.constraint(equalTo: self.gameBtn.centerYAnchor).isActive = true
            gameTitle.centerXAnchor.constraint(equalTo: self.gameBtn.centerXAnchor).isActive = true
            
            gameTitle.text = "Game"
            gameTitle.textColor = .white
            gameTitle.font = UIFont.systemFont(ofSize: 20)
            
            return contentView
        }
        let view = UIView()
        let text = UILabel()
        
        view.backgroundColor = UIColor(red: 0.11, green: 0.11, blue: 0.11, alpha: 1)
        
        view.addSubview(text)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        text.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 33).isActive = true
        
        text.textColor = .white
        text.font = UIFont.systemFont(ofSize: 20)
        text.text = "Statistics of the last ten tricks"

        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 250
        }else{
            return 100
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.selectedIndex.contains(indexPath){
            return 150
        }else{
            return 50
        }
    }
    
}

class StatTableViewCell: UITableViewCell{
    
    private var title = UILabel()
    private var difPie = PieChartView()
    private var stabPie = PieChartView()
    private let arrowImage = UIImageView()
    
    private let difView = StatView(type: .difficulty)
    private let stabView = StatView(type: .stability)
    
    private let stactkView = UIStackView()
    
    private var selfHeight : NSLayoutConstraint? = nil
    
    private let line1 = UIView()
    private let line = UIView()
    
    public var isSelect:Bool = false{
        didSet{
            UIView.animate(withDuration: 0.3) { [unowned self] in
                self.arrowImage.transform = self.isSelect ? CGAffineTransform(rotationAngle: CGFloat.pi) : CGAffineTransform(rotationAngle: 0)
//                self.stactkView.isHidden = !self.isSelect
                self.difView.isHidden = !self.isSelect
                self.stabView.isHidden = !self.isSelect
                self.line1.isHidden = !self.isSelect
                self.difPie.isHidden = self.isSelect
                self.stabPie.isHidden = self.isSelect
            }
        }
        
    }
    
    private func setUp(){
//        self.selfHeight = self.heightAnchor.constraint(equalToConstant: 50)
//        self.selfHeight?.isActive = true
        
        self.addSubview(self.title)
        self.title.translatesAutoresizingMaskIntoConstraints = false
//        if !self.isSelect{
//            self.title.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//        }else{
        self.title.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
//        }
        self.title.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 53).isActive = true
        
        self.title.textColor = .white
        self.title.font = UIFont.systemFont(ofSize: 18)
        
        self.addSubview(self.arrowImage)
        self.arrowImage.translatesAutoresizingMaskIntoConstraints = false
        self.arrowImage.centerYAnchor.constraint(equalTo: self.title.centerYAnchor).isActive = true
        self.arrowImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -39).isActive = true
        self.arrowImage.heightAnchor.constraint(equalToConstant: 24).isActive = true
        self.arrowImage.widthAnchor.constraint(equalTo: self.arrowImage.heightAnchor).isActive = true
        
        self.arrowImage.image = UIImage(named: "Menu/arrowIcon")
        
        self.addSubview(self.stabPie)
        self.stabPie.translatesAutoresizingMaskIntoConstraints = false
        self.stabPie.rightAnchor.constraint(equalTo: self.arrowImage.leftAnchor, constant: -16).isActive = true
        self.stabPie.centerYAnchor.constraint(equalTo: self.title.centerYAnchor).isActive = true
        self.stabPie.heightAnchor.constraint(equalToConstant: 24).isActive = true
        self.stabPie.widthAnchor.constraint(equalTo: self.stabPie.heightAnchor).isActive = true
        
        self.stabPie.segments = [Segment(color: UIColor(red: 0.128, green: 0.3, blue: 0.933, alpha: 1.0), value: 1),
                                 Segment(color: UIColor(red: 0.11, green: 0.11, blue: 0.11, alpha: 1), value: 1)]
        
        self.addSubview(self.difPie)
        self.difPie.translatesAutoresizingMaskIntoConstraints = false
        self.difPie.rightAnchor.constraint(equalTo: self.stabPie.leftAnchor, constant: -16).isActive = true
        self.difPie.centerYAnchor.constraint(equalTo: self.title.centerYAnchor).isActive = true
        self.difPie.heightAnchor.constraint(equalToConstant: 24).isActive = true
        self.difPie.widthAnchor.constraint(equalTo: self.difPie.heightAnchor).isActive = true
        
        self.difPie.segments = [Segment(color: UIColor(red: 0.128, green: 0.3, blue: 0.933, alpha: 1.0), value: 1),
                                Segment(color: UIColor(red: 0.11, green: 0.11, blue: 0.11, alpha: 1), value: 1) ]
        
        self.addSubview(self.line)
        self.line.translatesAutoresizingMaskIntoConstraints = false
        self.line.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.line.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.line.topAnchor.constraint(equalTo: self.arrowImage.bottomAnchor, constant: 10).isActive = true
        self.line.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        self.line.backgroundColor = UIColor(hex: "505050")
        
        self.addSubview(self.stactkView)
        self.stactkView.translatesAutoresizingMaskIntoConstraints = false
        self.stactkView.topAnchor.constraint(equalTo: line.bottomAnchor, constant: 14).isActive = true
        self.stactkView.leftAnchor.constraint(equalTo: self.title.leftAnchor).isActive = true
        self.stactkView.rightAnchor.constraint(equalTo: self.arrowImage.rightAnchor).isActive = true

        self.stactkView.axis = .vertical
        self.stactkView.distribution = .fillEqually
        self.stactkView.spacing = 10

        self.stactkView.addArrangedSubview(self.difView)
        self.stactkView.addArrangedSubview(self.stabView)
        
        self.difView.isHidden = true
        self.stabView.isHidden = true
            
        self.addSubview(self.line1)
        self.line1.translatesAutoresizingMaskIntoConstraints = false
        self.line1.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.line1.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.line1.topAnchor.constraint(equalTo: self.stactkView.bottomAnchor, constant: 18).isActive = true
        self.line1.heightAnchor.constraint(equalToConstant: 1).isActive = true

        self.line1.backgroundColor = UIColor(hex: "505050")
        
        self.line1.isHidden = true
    }
    
    internal func configure(with trick: Trick, isSelect: Bool){
        self.setUp()
        self.isSelect = isSelect
        
        self.title.text = trick.name
        let mainColor = UIColor(red: 0.11, green: 0.11, blue: 0.11, alpha: 1)
        let difColor = UIColor(red: 0.128, green: 0.3, blue: 0.933, alpha: 1.0)
        let stabColor = UIColor(hex: "617DDC")
        self.difPie.segments = [Segment(color: difColor, value:  CGFloat(trick.complexity)),
            Segment(color: mainColor, value: CGFloat(10 - trick.complexity))]
        self.stabPie.segments = [Segment(color: stabColor, value: CGFloat(trick.stability)),
            Segment(color: mainColor, value: CGFloat( 10 - trick.stability))]
        self.difPie.draw(self.difPie.frame)
        self.stabPie.draw(self.stabPie.frame)
        
        self.difView.configure(with: trick)
        self.stabView.configure(with: trick)
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        self.backgroundColor =  UIColor(red: 0.11, green: 0.11, blue: 0.11, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension StatTableViewCell{
    private class StatView: UIView{
        
        private var valueLabel = UILabel()
        private var pieChart = PieChartView()
        private var title = UILabel()
        
        private var type: StatType = .difficulty
        
        init(type: StatType){
            super.init(frame: .zero)
            self.type = type
            self.setUp()
        }
        
        override init(frame: CGRect) {
            super.init(frame: frame)
        }
        
        func setUp(){
            self.translatesAutoresizingMaskIntoConstraints = false
            self.heightAnchor.constraint(equalToConstant: 30).isActive = true
            
            self.addSubview(self.valueLabel)
            self.valueLabel.translatesAutoresizingMaskIntoConstraints = false
            self.valueLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            self.valueLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
            
            self.valueLabel.font = UIFont.systemFont(ofSize: 14)
            self.valueLabel.textColor = self.type.color
            
            self.addSubview(self.pieChart)
            self.pieChart.translatesAutoresizingMaskIntoConstraints = false
            self.pieChart.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            self.pieChart.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            self.pieChart.heightAnchor.constraint(equalToConstant: 24).isActive = true
            self.pieChart.widthAnchor.constraint(equalTo: self.pieChart.heightAnchor).isActive = true
            
            self.addSubview(self.title)
            self.title.translatesAutoresizingMaskIntoConstraints = false
            self.title.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
            self.title.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            
            self.title.font = UIFont.systemFont(ofSize: 14)
            self.title.textColor = .white
            
            self.title.text = self.type.title
            
        }
        
        func configure(with trick: Trick){
            let mainColor = UIColor(red: 0.11, green: 0.11, blue: 0.11, alpha: 1)
            switch self.type {
            case .difficulty:
                self.valueLabel.text = String(trick.complexity)
                self.pieChart.segments = [Segment(color: self.type.color, value: CGFloat(trick.complexity)),
                Segment(color: mainColor, value: CGFloat( 10.0 - Double(trick.complexity)))]
            case .stability:
                self.valueLabel.text = "\(trick.stability)/10"
                self.pieChart.segments = [Segment(color: self.type.color, value: CGFloat(trick.stability)),
                Segment(color: mainColor, value: CGFloat( 10.0 - Double(trick.stability)))]
            }
            
            self.pieChart.draw(self.pieChart.frame)
            
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    enum StatType: Int{
        case difficulty
        case stability
        //        case totalCount
        
        var color: UIColor{
            switch self {
            case .difficulty:
                return UIColor(hex: "214FEF")
            case .stability:
                return UIColor(hex: "617DDC")
                //            case .totalCount:
                //                return UIColor(hex: "C8D1EF")
            }
        }
        
        var title: String{
            switch self {
            case .difficulty:
                return "Difficulty"
            case .stability:
                return "Stability"
                //            case .totalCount:
                //                return "Total Counе tries"
            }
        }
    }
    
    private struct Segment {
        
        // the color of a given segment
        var color: UIColor
        
        // the value of a given segment – will be used to automatically calculate a ratio
        var value: CGFloat
    }
    
    private class PieChartView: UIView {
        
        /// An array of structs representing the segments of the pie chart
        var segments = [Segment]() {
            didSet {
                setNeedsDisplay() // re-draw view when the values get set
            }
        }
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            self.layer.borderColor = UIColor(red: 0.314, green: 0.314, blue: 0.314, alpha: 1).cgColor
            self.layer.borderWidth = 1
            self.layer.cornerRadius = 24 / 2
            isOpaque = false // when overriding drawRect, you must specify this to maintain transparency.
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }
        
        override func draw(_ rect: CGRect) {
            self.layer.cornerRadius = rect.height / 2
            // get current context
            let ctx = UIGraphicsGetCurrentContext()
            
            // radius is the half the frame's width or height (whichever is smallest)
            let radius = min(frame.size.width, frame.size.height) * 0.5
            
            // center of the view
            let viewCenter = CGPoint(x: bounds.size.width * 0.5, y: bounds.size.height * 0.5)
            
            // enumerate the total value of the segments by using reduce to sum them
            let valueCount = segments.reduce(0, {$0 + $1.value})
            
            // the starting angle is -90 degrees (top of the circle, as the context is flipped). By default, 0 is the right hand side of the circle, with the positive angle being in an anti-clockwise direction (same as a unit circle in maths).
            var startAngle = -CGFloat.pi * 0.5
            
            for segment in segments { // loop through the values array
                
                // set fill color to the segment color
                ctx?.setFillColor(segment.color.cgColor)
                
                // update the end angle of the segment
                let endAngle = startAngle + 2 * .pi * (segment.value / valueCount)
                
                // move to the center of the pie chart
                ctx?.move(to: viewCenter)
                
                // add arc from the center for each segment (anticlockwise is specified for the arc, but as the view flips the context, it will produce a clockwise arc)
                ctx?.addArc(center: viewCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
                
                // fill segment
                ctx?.fillPath()
                
                // update starting angle of the next segment to the ending angle of this segment
                startAngle = endAngle
            }
        }
    }
}
