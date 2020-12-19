//
//  SelectCurrencyTableViewModel.swift
//  currencyConverter
//
//  Created by OnlyFrenzy on 17.12.2020.
//

import Foundation


class SelectCurrencyTableViewModel {
    
    private let valuteManager = ValuteManager.shared
    
    private var valuteArray: [ValuteInformation]
    
    weak var displayDelegate: SelectCurrencyTableDisplayDelegate?
    
    init() {
        valuteArray = valuteManager.valutes.map { valute -> ValuteInformation in
            return valute.value
        }
    }
    
    func valuteCount() -> Int {
        return valuteArray.count
    }
    
    func cellViewModel(index: Int) -> CurrencyCellViewModel {
        let currentCharCode = valuteManager.currentCharCode
        let isSelected = valuteArray[index].charCode == currentCharCode
        
        return CurrencyCellViewModel(valute: valuteArray[index], isSelected: isSelected)
    }
    
    func didSelectRowAt(index: Int) {
        let currency = valuteArray[index].charCode ?? ""
        valuteManager.setCurrency(currency: currency)
        displayDelegate?.reloadData()
    }
    
    
}
