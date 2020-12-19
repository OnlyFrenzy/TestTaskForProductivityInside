//
//  CurrencyCell.swift
//  currencyConverter
//
//  Created by OnlyFrenzy on 19.12.2020.
//

import UIKit

class CurrencyCell: UITableViewCell {
    
    static let identifire = "CurrencyCell"
    
    var viewModel: CurrencyCellViewModel!
    
    
    
    @IBOutlet weak var valuteFullNameLabel: UILabel!
    @IBOutlet weak var valuteShortNameLabel: UILabel!
    @IBOutlet weak var isSelectedImageView: UIImageView!
    
    func setup() {
        valuteFullNameLabel.text = viewModel.fullName()
        valuteShortNameLabel.text = viewModel.shortName()
        isSelectedImageView.isHidden = !viewModel.isSelected
    }
}
