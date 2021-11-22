//
//  HistoryTableViewController.swift
//  Swiftbook_BudgetHelperProject
//
//  Created by Варвара Фомина on 20.11.2021.
//

import UIKit

class HistoryTableViewController: UITableViewController {
    
    private var history = Action.getData()
    var newHistory: [Action]!
    
    func sorted(for: [Action]) -> [Action]{
        var sorted: [Action] = []
        for item in history {
            if item.startDate <= Date() {
                sorted.append(item)
            }
        }
        return sorted.sorted(by: {$0.startDate > $1.startDate})
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sorted(for: history).count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "history") as! HistoryTableViewCell
        let nameHistory = sorted(for: history)[indexPath.row]
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        cell.sumLable.text = "\(Int(nameHistory.amount)) \(Exchange.ruble.rawValue)"
        cell.dateLabel.text = "\(dateFormatter.string(from: nameHistory.startDate))"
        if nameHistory.direction == true {
            cell.spendOrProfit.layer.backgroundColor = CGColor.init(red: 0.19, green: 0.54, blue: 0.16, alpha: 1)
        } else {
            cell.spendOrProfit.layer.backgroundColor = CGColor.init(red: 0.50, green: 0.21, blue: 0.20, alpha: 1)
        }
        
        return cell
    }
    
    override  func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let newVC = segue.destination as? NewActionViewController else { return }
        newVC.newHistory = history
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        guard let newVC =  unwindSegue.source as? NewActionViewController else {return}
        newHistory = newVC.saveAction()
        history += newHistory
        tableView.reloadData()
    }
    
}

