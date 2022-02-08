//
//  ViewController.swift
//  IdealKadai12
//
//  Created by 中野翔太 on 2022/02/08.
//

import UIKit

class TaxCalcViewController: UIViewController, TaxRepositoryDelegate {


    @IBOutlet weak var taxExcludedTextField: UITextField!
    @IBOutlet weak var taxRateTextField: UITextField!
    @IBOutlet weak var taxIncludedLabel: UILabel!

     private let taxRepository = TaxRateRepository()
     private let priceCalculator = PriceCalculalator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taxRepository.delegate = self
        taxRepository.loadData { [weak self] in
            self?.taxRateTextField.text = String($0)
            print($0)
        }

    }

    @IBAction func didTapButton(_ sender: Any) {
        guard let taxExcluded = Double(taxExcludedTextField.text!),
              let taxRateTex = Double(taxRateTextField.text!) else { return }
    let priceWithTax =    priceCalculator.calculatePriceWithTax(priceWithoutTax:Int(taxExcluded),
                                              taxRate: taxRateTex / 100.0)
        taxRepository.save(taxRate: Int(taxRateTex))
        
        taxIncludedLabel.text = "\(priceWithTax)円"
    }
    func didSave(date: Int) {
        print("UserDafalutsに消費税率\(date)%が保存されまし")
    }
    

}

