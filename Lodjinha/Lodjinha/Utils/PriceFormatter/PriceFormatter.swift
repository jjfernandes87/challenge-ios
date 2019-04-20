//
//  PriceFormatter.swift
//  Lodjinha
//
//  Created by Julio Fernandes on 14/04/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit

private let instance = PriceFormatter()

class PriceFormatter: NSObject {
    var currencyFormatter: NumberFormatter?
    
    class var shared: PriceFormatter {
        return instance
    }
    
    override init() {
        super.init()
        self.setup(locale: "pt_BR")
    }
    
    func setup(locale: String) {
        currencyFormatter = NumberFormatter()
        currencyFormatter?.numberStyle = .currency
        currencyFormatter?.locale = Locale(identifier: locale)
        currencyFormatter?.generatesDecimalNumbers = false
        currencyFormatter?.maximumFractionDigits = 0
        
        guard #available(iOS 12.0, *) else {
            currencyFormatter?.currencySymbol = currencyFormatter?.currencySymbol.appending("\u{00A0}")
            return
        }
    }
    
    func changeCharactersInRangeFormatter(_ range: NSRange, string: String, currentString: NSString) -> String {
        objc_sync_enter(currencyFormatter!)
        let newText = currentString.replacingCharacters(in: range, with: string)
            .replacingOccurrences(of: currencyFormatter!.currencySymbol!, with: String())
            .replacingOccurrences(of: currencyFormatter!.groupingSeparator!, with: String())
            .replacingOccurrences(of: currencyFormatter!.decimalSeparator!, with: String())
        objc_sync_exit(currencyFormatter!)
        
        return newText
    }
    
    func doubleToCurrencyStringFormatter(_ number: Double) -> String {
        return doubleToCurrencyStringFormatterAndMaximumFractionDigits(number, maximumFractionDigits: 2)
    }
    
    func doubleToCurrencyStringFormatterAndMaximumFractionDigits(_ number: Double, maximumFractionDigits: Int) -> String {
        objc_sync_enter(currencyFormatter!)
        currencyFormatter!.generatesDecimalNumbers = maximumFractionDigits > 0
        currencyFormatter!.maximumFractionDigits = maximumFractionDigits
        currencyFormatter!.minimumFractionDigits = maximumFractionDigits
        objc_sync_exit(currencyFormatter!)
        
        return currencyFormatter!.string(from: NSNumber(value: number as Double))!
    }
}

