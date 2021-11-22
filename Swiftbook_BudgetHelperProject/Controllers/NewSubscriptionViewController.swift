//
//  NewSubscriptionViewController.swift
//  Swiftbook_BudgetHelperProject
//
//  Created by Варвара Фомина on 19.11.2021.
//

import UIKit

class NewSubscriptionViewController: UIViewController {
    
    
    var newSubscription: [Action]!
    
    
    @IBOutlet var nameSubscriptionTF: UITextField!
    @IBOutlet var ammountTF: UITextField!
    @IBOutlet var dateSubscription: UIDatePicker!
    @IBOutlet var periodicitySubscription: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        
    }
    
    func periodicity() -> Action.Frequency {
        var action: Action.Frequency
        switch periodicitySubscription.selectedSegmentIndex{
        case 0:
            action = Action.Frequency.week
        case 1:
            action = Action.Frequency.month
        default:
            action =  Action.Frequency.year
        }
        return action
    }
    
    func pressdOK() -> [Action] {
        let ammount: Double = Double(ammountTF.text ?? "") ?? 0.0
        newSubscription.append(Action(amount: ammount, direction: false, startDate: dateSubscription.date, frequency: periodicity(), exchange: Exchange.ruble, name: nameSubscriptionTF.text ?? ""))
        return newSubscription
    }
}

