//
//  MyPlansViewController.swift
//  Swiftbook_BudgetHelperProject
//
//  Created by Сергей on 14.11.2021.
//

import UIKit

class MyPlansViewController: UIViewController {
    
    private let accumulation = Accumulation.getData()
    
    //MARK: accumulationView Outlets
    @IBOutlet var accumulationBackgroundView: UIView!
    @IBOutlet var accumulationTitle: UILabel!
    @IBOutlet var accumulationAmountTitle: UILabel!
    
    @IBOutlet var progressOfAccumulation: UIProgressView!
    
    @IBOutlet var subscriptionsBackgroundView: UIView!
    @IBOutlet var subscriptionsButton: UIButton!
    
    @IBOutlet var accumulationsBackgroundView: UIView!
    @IBOutlet var accumulationsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstAccumulation = accumulation.first
        customizingButtonsAndView()
        customizingCurrentAccumulationView ()
        accumulationTitle.text = accumulation.first?.name
        accumulationAmountTitle.text = "\(Int(firstAccumulation?.currentAmount ?? 0))/\(firstAccumulation?.totalAmount.description ?? "")\(firstAccumulation?.exchange.rawValue ?? "error")"
        progress()
        
    }
    
    
    func progress()  {
        let totalProgress = Float(accumulation.first?.percent ?? 46)
        print (totalProgress)
        progressOfAccumulation.setProgress(totalProgress, animated: false)
    }
    
}
extension MyPlansViewController {
    func customizingCurrentAccumulationView (){
        accumulationBackgroundView.layer.cornerRadius = 10
        accumulationBackgroundView.layer.shadowColor = CGColor.init(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.2)
        accumulationBackgroundView.layer.shadowOpacity = 1
        accumulationBackgroundView.layer.shadowOffset = .init(width: 0, height: 7)
        accumulationBackgroundView.layer.shadowRadius = 20
    }
}

extension MyPlansViewController {
    func customizingButtonsAndView() {
        accumulationsBackgroundView.layer.cornerRadius = 10
        accumulationsBackgroundView.layer.shadowColor = CGColor.init(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.2)
        accumulationsBackgroundView.layer.shadowOpacity = 1
        accumulationsBackgroundView.layer.shadowOffset = .init(width: 0, height: 7)
        accumulationsBackgroundView.layer.shadowRadius = 20
        
        subscriptionsBackgroundView.layer.cornerRadius = 10
        subscriptionsBackgroundView.layer.shadowColor = CGColor.init(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.2)
        subscriptionsBackgroundView.layer.shadowOpacity = 1
        subscriptionsBackgroundView.layer.shadowOffset = .init(width: 0, height: 7)
        subscriptionsBackgroundView.layer.shadowRadius = 20
    }
}

