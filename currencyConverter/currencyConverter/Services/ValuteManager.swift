//
//  ValuteManager.swift
//  currencyConverter
//
//  Created by OnlyFrenzy on 19.12.2020.
//

import Foundation

class ValuteManager {
    
    static let shared = ValuteManager()
    
    private(set) var valutes = [String: ValuteInformation]()
    private(set) var leftCurrency: String = ""
    private(set) var leftValue: Double = 1
    private(set) var leftNominal: Double = 1
    private(set) var rightCurrency: String = ""
    private(set) var rightValue: Double = 1
    private(set) var rightNominal: Double = 1
    private(set) var isCurrentLeft: Bool = true
    
    var currentCharCode: String {
        return isCurrentLeft ? leftCurrency : rightCurrency
    }
    
    func setCurrentSide(isCurrentLeft: Bool) {
        self.isCurrentLeft = isCurrentLeft
    }
    
    var ruble = ValuteInformation(charCode: "RUB", name: "Рубль", nominal: 1, value: 1)
    
    func setValutes(valutes: [String: ValuteInformation]) {
        self.valutes = valutes
        self.valutes.updateValue(ruble, forKey: "RUB")
    }
    
    func setCurrency(currency: String) {
        
        let valuteInfo = valutes[currency]
        
        if isCurrentLeft {
            
            leftCurrency = currency
            
            guard let thisValuteValue = valuteInfo?.value else { print("Not left valute value"); return }
            leftValue = thisValuteValue
            
            guard let thisValuteNominal = valuteInfo?.nominal else { print("Not left valute nominal"); return }
            leftNominal = thisValuteNominal
            
        } else {
            
            rightCurrency = currency
            
            guard let thisValuteValue = valuteInfo?.value else { print("Not right valute value"); return }
            rightValue = thisValuteValue
            
            guard let thisValuteNominal = valuteInfo?.nominal else { print("Not right valute nominal"); return }
            rightNominal = thisValuteNominal
        }
    }
    
    func convertLeftToRightCurrency(enterValue: String) -> String {
        guard let doubleEnterValue = Double(enterValue) else { return "0.0" }
        return String(doubleEnterValue * (leftValue / leftNominal) / (rightValue / rightNominal))
    }
    
    func convertRightToLeftCurrency(enterValue: String) -> String {
        guard let doubleEnterValue = Double(enterValue) else { return "0.0" }
        return String(doubleEnterValue * (rightValue / rightNominal) / (leftValue / leftNominal))
    }
}
