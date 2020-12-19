//
//  CurrencyConverterScreenViewModel.swift
//  currencyConverter
//
//  Created by OnlyFrenzy on 17.12.2020.
//

import UIKit

class CurrencyConverterScreenViewModel {
    
    private let networkService = NetworkService()
    private let valuteManager = ValuteManager.shared
    
    weak var displayDelegate: CurrencyConverterScreenDisplayDelegate?
    
    func viewVillAppear() {
        firstCurrency = valuteManager.leftCurrency
        secondCurrency = valuteManager.rightCurrency
    }
    
    func fetchNewData() {
        networkService.request(link: .centrobankLink) { [weak self] (currencyJsonResponce, error) in
            if error != nil {
                self?.displayDelegate?.showError()
            }
            guard let currencyJsonResponce = currencyJsonResponce else { return }
            self?.valuteManager.setValutes(valutes: currencyJsonResponce.valute)
            self?.displayDelegate?.hideActivityIndicator()
        }
    }
    
    func convertFirstToSecondValute(firstEnterValue: String) {
        displayDelegate?.showFirstValue(value: valuteManager.convertLeftToRightCurrency(enterValue: firstEnterValue))
    }
    
    func convertSecondToFirstValute(secondEnterValue: String) {
        displayDelegate?.showSecondValue(value: valuteManager.convertRightToLeftCurrency(enterValue: secondEnterValue))
    }
    
    func onClickSelectCurrencyButton(currentValute: String, isLeftSide: Bool) {
        valuteManager.setCurrentSide(isCurrentLeft: isLeftSide)
        valuteManager.setCurrency(currency: currentValute)
        let selectCurrencyTableViewModel = SelectCurrencyTableViewModel()
        displayDelegate?.showSelectCurrency(viewModel: selectCurrencyTableViewModel)
    }
    
        var firstCurrency: String = "RUB" {
            didSet {
                displayDelegate?.showFirstCurrency(value: firstCurrency)
            }
        }
    
        var secondCurrency: String = "EUR" {
            didSet {
                displayDelegate?.showSecondCurrency(value: secondCurrency)
            }
        }
}
