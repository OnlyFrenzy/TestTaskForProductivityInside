//
//  CurrencyCellViewModel.swift
//  currencyConverter
//
//  Created by OnlyFrenzy on 19.12.2020.
//

import Foundation


class CurrencyCellViewModel {
    
    private let valute: ValuteInformation
    var isSelected: Bool
    
    init(valute: ValuteInformation, isSelected: Bool) {
        self.valute = valute
        self.isSelected = isSelected
    }
    
    func fullName() -> String {
        return valute.name ?? ""
    }
    
    func shortName() -> String {
        return valute.charCode ?? ""
    }
    
    func value() -> Double {
        return valute.value ?? 1
    }
    
    func nominal() -> Double {
        return valute.nominal ?? 1
    }
}
