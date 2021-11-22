//
//  AccumulationTableViewController.swift
//  Swiftbook_BudgetHelperProject
//
//  Created by Варвара Фомина on 16.11.2021.
//

import UIKit

class AccumulationTableViewController: UITableViewController {
    
     var accumulation = Accumulation.getData()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accumulation.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "accumulation") as! AccumulationTableViewCell
        let newAccumulation = accumulation[indexPath.row]
        cell.dateLabel.text = "\(newAccumulation.duration) months"
        cell.nameLabel.text = newAccumulation.name
        cell.sumLable.text = "\(Int(newAccumulation.currentAmount))/\(newAccumulation.totalAmount)\(newAccumulation.exchange.rawValue)"
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let newAccVC = segue.destination as? NewAccumulationViewController else { return }
        newAccVC.newAccumulation = accumulation
    }
   
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
         guard let newAccVC = unwindSegue.source as? NewAccumulationViewController else { return }
         accumulation = newAccVC.saveNewAccumulation()
         tableView.reloadData()
    }

}
