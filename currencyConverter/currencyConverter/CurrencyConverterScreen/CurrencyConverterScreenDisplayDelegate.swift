//
//  CurrencyConverterScreenDisplayDelegate.swift
//  currencyConverter
//
//  Created by OnlyFrenzy on 17.12.2020.
//

import UIKit

protocol CurrencyConverterScreenDisplayDelegate: class {
    func showFirstCurrency(value: String)
    func showSecondCurrency(value: String)
    func showSelectCurrency(viewModel: SelectCurrencyTableViewModel)
    func showError()
    func hideActivityIndicator()
    func showFirstValue(value: String)
    func showSecondValue(value: String)
}
