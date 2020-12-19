//
//  SelectCurrencyTableViewController.swift
//  currencyConverter
//
//  Created by OnlyFrenzy on 17.12.2020.
//

import UIKit

class SelectCurrencyTableViewController: UIViewController {
    
    var currencyJsonResponce: CurrencyJsonResponce? = nil
    var viewModel: SelectCurrencyTableViewModel!
    
    @IBOutlet weak var selectCurrencyTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Выбор валют"
        setupTableView()
    }
    
    private func setupTableView() {
        selectCurrencyTableView.delegate = self
        selectCurrencyTableView.dataSource = self
        selectCurrencyTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
}


extension SelectCurrencyTableViewController: UITableViewDelegate, UITableViewDataSource {
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.valuteCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyCell.identifire, for: indexPath) as! CurrencyCell
        cell.viewModel = viewModel.cellViewModel(index: indexPath.row)
        cell.setup()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectRowAt(index: indexPath.row)
    }
}

extension SelectCurrencyTableViewController: SelectCurrencyTableDisplayDelegate {
    func reloadData() {
        DispatchQueue.main.async {
            self.selectCurrencyTableView.reloadData()
        }
    }
    
    
}
