//
//  Model.swift
//  IdealKadai12
//
//  Created by 中野翔太 on 2022/02/08.
//

import Foundation

struct PriceCalculalator {
    /// 税込価格を計算する
        /// - Parameters:
        ///   - priceWithoutTax: 税抜価格
        ///   - taxRatePercentage: 消費税率。例えば8%の場合、0.08を渡す。
        /// - Returns: 税込価格
    func calculatePriceWithTax(priceWithoutTax: Int, taxRate: Double) -> Int {
        priceWithoutTax + Int(Double(priceWithoutTax) * taxRate)
    }
}
