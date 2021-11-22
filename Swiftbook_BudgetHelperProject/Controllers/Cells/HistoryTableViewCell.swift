//
//  HistoryTableViewCell.swift
//  Swiftbook_BudgetHelperProject
//
//  Created by Сергей on 21.11.2021.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    @IBOutlet var background: UIView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var spendOrProfit: UIView!
    @IBOutlet var sumLable: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: -6, left: 0, bottom: -6, right: 0))
        background.layer.cornerRadius = 10
        background.layer.shadowColor = CGColor.init(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.2)
        background.layer.shadowOpacity = 1
        background.layer.shadowOffset = .init(width: 0, height: 3)
        background.layer.shadowRadius = 4
        spendOrProfit.layer.cornerRadius = spendOrProfit.frame.height / 2
    }

}
