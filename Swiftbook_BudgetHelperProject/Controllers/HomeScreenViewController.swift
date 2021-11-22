//
//  HomeScreenViewController.swift
//  Swiftbook_BudgetHelperProject
//
//  Created by Сергей on 14.11.2021.
//

import UIKit

class HomeScreenViewController: UIViewController {
    
    private let actions = Action.getData()
    
    
    @IBOutlet var summLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        summLabel.text = "\(Int(user.account))\(user.exchange.rawValue)"
        print (user.account)
    }
    
    func futureSubscriptions(for: [Action]) -> [Action]{
        var futureSubscriptions: [Action] = []
        for item in actions {
            if item.frequency != .none && item.startDate >= Date() && item.direction == false {
                futureSubscriptions.append(item)
            }
        }
        return futureSubscriptions.sorted(by: {$0.startDate < $1.startDate})

    }
}

extension HomeScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return futureSubscriptions(for: actions).count
    }
    //Передача данных в кастомную ячейку
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "action") as! HomeScreenTableViewCell
        let nameAction = futureSubscriptions(for: actions)[indexPath.row]
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        cell.nameLabel.text = nameAction.name 
        cell.dateLabel.text = dateFormatter.string(from: nameAction.startDate)
        cell.sumLable.text = "\(Int(nameAction.amount)) \(Exchange.ruble.rawValue)"
        return cell
        
        
    }
    
}
