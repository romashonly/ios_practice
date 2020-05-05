//
//  StatisticViewController.swift
//  WinsIOSPractice
//
//  Created by Роман Шуркин on 05.05.2020.
//  Copyright © 2020 Hope To. All rights reserved.
//

import UIKit

class StatisticViewController: UITableViewController {
    
    static func show(parent: UIViewController) {
        let view = StatisticViewController()
        
        let presentor = StatisticPresentor()
        let interactor = StatisticInteractor()
        
        presentor.view = view
        interactor.output = presentor
        
        interactor.getTricks()
        
        parent.present(view, animated: true, completion: nil)
    }
    
    private var tricks = [Trick]()
    private var selectedIndex = [IndexPath]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(StatTableViewCell.self, forCellReuseIdentifier: "StatTableViewCell")
        self.tableView.separatorStyle = .none
        self.view.backgroundColor = UIColor(red: 0.11, green: 0.11, blue: 0.11, alpha: 1)
        self.tableView.backgroundColor = UIColor(red: 0.11, green: 0.11, blue: 0.11, alpha: 1)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tricks.count
    }
        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StatTableViewCell", for: indexPath) as! StatTableViewCell
        let trick = self.tricks[indexPath.row]
            cell.configure(with: trick, isSelect: self.selectedIndex.contains(indexPath))
            return cell
        }
        
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
        
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let view = UIView()
            let text = UILabel()
            
            view.backgroundColor = UIColor(red: 0.11, green: 0.11, blue: 0.11, alpha: 1)
            
            view.addSubview(text)
            text.translatesAutoresizingMaskIntoConstraints = false
            text.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            text.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 33).isActive = true
            
            text.textColor = .white
            text.font = UIFont.systemFont(ofSize: 20)
            text.text = "Stat for last ten tricks"
            
            return view
        }
        
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 0
        }
        
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            if self.selectedIndex.contains(indexPath){
                return 150
            }else{
                return 50
            }
        }
    
}

extension StatisticViewController: StatViewInput {
    func configure(with tricks: [Trick]) {
        self.tricks = tricks
        self.tableView.reloadData()
    }
}
