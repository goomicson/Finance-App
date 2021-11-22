//
//  NewAccumulationViewController.swift
//  Swiftbook_BudgetHelperProject
//
//  Created by Варвара Фомина on 19.11.2021.
//

import UIKit

class NewAccumulationViewController: UIViewController {
    
    @IBOutlet var nameTF: UITextField!
    @IBOutlet var currencySegment: UISegmentedControl!
    @IBOutlet var accumulationAmountTF: UITextField!
    @IBOutlet var mounthTF: UITextField!
    
    var newAccumulation: [Accumulation]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    func calculatingPayPerMonth() -> Int {
        let accumulationSum: Int = Int(accumulationAmountTF.text!) ?? 0
        let months: Int = Int(mounthTF.text!) ?? 1
        let sumPerMonth = accumulationSum / months
        return sumPerMonth
    }
    
    func currencySelection() -> Exchange {
        var currency: Exchange
        switch currencySegment.selectedSegmentIndex{
        case 0:
            currency = Exchange.euro
        case 1:
            currency = Exchange.dollar
        default:
            currency = Exchange.ruble
        }
        return currency
    }
    
    func saveNewAccumulation() -> [Accumulation] {
        let totalAmount:Double = Double(accumulationAmountTF.text ?? "") ?? 0.0
        let mount: Int = Int(mounthTF.text ?? "") ?? 0
        newAccumulation.append(Accumulation(name: nameTF.text ?? "", totalAmount: Int(totalAmount), dayOfProfit: Date.now, duration: mount, exchange: currencySelection()))
        
        return newAccumulation
        
    }
}
