//
//  CurrencyConverterScreenViewController.swift
//  currencyConverter
//
//  Created by OnlyFrenzy on 17.12.2020.
//

import UIKit





class CurrencyConverterScreenViewController: UIViewController {
    
    
    @IBOutlet weak var currencyDownloadErrorView: UIView!
    @IBOutlet weak var currencyActivityView: UIView!
    @IBOutlet weak var currencyMainView: UIView!
    
    @IBOutlet weak var firstCurrencyTextField: UITextField!
    @IBOutlet weak var firstCurrencyLabel: UILabel!
    @IBOutlet weak var firstSelectCurrencyButton: UIButton!
    @IBOutlet weak var secondCurrencyTextField: UITextField!
    @IBOutlet weak var secondCurrencyLabel: UILabel!
    @IBOutlet weak var secondSelectCurrencyButton: UIButton!
    

    @IBOutlet weak var loadExchangeRatesActivityIndicator: UIActivityIndicatorView!
    
    
    var viewModel: CurrencyConverterScreenViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CurrencyConverterScreenViewModel()
        viewModel.displayDelegate = self
        navigationItem.title = "Конвертер валют"
        navigationItem.backButtonTitle = "Отмена"
        navigationItem.hidesBackButton = true
        setupTextField()
        setupButtons()
        viewModel.fetchNewData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewVillAppear()
    }
    
    private func setupButtons() {
        firstSelectCurrencyButton.addTarget(self, action: #selector(onClickFirstSelectCurrencyButton), for: .touchUpInside)
        secondSelectCurrencyButton.addTarget(self, action: #selector(onClickSecondSelectCurrencyButton), for: .touchUpInside)
    }
    
    func setupTextField() {
        firstCurrencyTextField.addTarget(self, action: #selector(firstTextFieldDidChange), for: .editingChanged)
        secondCurrencyTextField.addTarget(self, action: #selector(secondTextFieldDidChange), for: .editingChanged)
    }
    
    @objc func firstTextFieldDidChange(_ textField: UITextField) {
        viewModel.convertFirstToSecondValute(firstEnterValue: firstCurrencyTextField.text ?? "0")
    }
    
    @objc func secondTextFieldDidChange(_ textField: UITextField) {
        viewModel.convertSecondToFirstValute(secondEnterValue: secondCurrencyTextField.text ?? "0")
    }
    
    
    @objc
    private func onClickFirstSelectCurrencyButton() {
        guard let text = firstCurrencyLabel.text else { return }
        viewModel.onClickSelectCurrencyButton(currentValute: text, isLeftSide: true)
    }
    
    @objc
    private func onClickSecondSelectCurrencyButton() {
        guard let text = secondCurrencyLabel.text else { return }
        viewModel.onClickSelectCurrencyButton(currentValute: text, isLeftSide: false)
    }
    
}

extension CurrencyConverterScreenViewController: CurrencyConverterScreenDisplayDelegate {
    func showFirstValue(value: String) {
        secondCurrencyTextField.text = value
    }
    
    func showSecondValue(value: String) {
        firstCurrencyTextField.text = value
    }
    
    func showError() {
        DispatchQueue.main.async {
            self.currencyActivityView.isHidden = true
            self.currencyMainView.isHidden = true
            self.currencyDownloadErrorView.isHidden = false
        }
    }
    
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            self.currencyActivityView.isHidden = true
            self.currencyMainView.isHidden = false
            self.currencyDownloadErrorView.isHidden = true
        }
    }
    
    
    func showSelectCurrency(viewModel: SelectCurrencyTableViewModel) {
        
        let selectCurrencyStoryboard = UIStoryboard(name: "SelectCurrencyTableViewController", bundle: nil)
        
        guard let selectCurrencyViewController = selectCurrencyStoryboard.instantiateInitialViewController() as? SelectCurrencyTableViewController else { return }
        
        selectCurrencyViewController.viewModel = viewModel
        selectCurrencyViewController.viewModel.displayDelegate = selectCurrencyViewController
        navigationController?.pushViewController(selectCurrencyViewController, animated: true)
    }
    
    func showFirstCurrency(value: String) {
        firstCurrencyLabel.text = value
    }
    
    func showSecondCurrency(value: String) {
        secondCurrencyLabel.text = value
    }
}
    

