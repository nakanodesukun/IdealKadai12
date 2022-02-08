//
//  TaxRateRepository.swift
//  IdealKadai12
//
//  Created by 中野翔太 on 2022/02/08.
//

import Foundation

protocol TaxRepositoryDelegate: AnyObject {
    func didSave(date: Int)
}
private let taxCalcKey = "TaxCalc"

class TaxRateRepository {
    var delegate: TaxRepositoryDelegate?

    func loadData(didLoad: @escaping(Int) -> Void) {
        let userDefaultsTaxRate = UserDefaults.standard.integer(forKey: taxCalcKey)
        // クロージャーについて
        didLoad(userDefaultsTaxRate)
    }

    func save(taxRate: Int) {
        let userDefaults = UserDefaults.standard
        userDefaults.setValue(taxRate, forKey: taxCalcKey)
        delegate?.didSave(date: taxRate)
    }

}
