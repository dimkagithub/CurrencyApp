//
//  CurrencyTableViewController.swift
//  CurrencyApp
//
//  Created by Дмитрий on 26.12.2020.
//

import UIKit

class CurrencyTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRates()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sleep(1)
        return currencyCharCode.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyViewCell", for: indexPath) as! CurrencyViewCell
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(0)) {
            cell.currencyCharCode.text = currencyCharCode[indexPath.row]
            cell.currencyName.text = String("\(currencyNominal[indexPath.row]) \(currencyName[indexPath.row])")
            cell.currencyValue.text = String("\(currencyValue[indexPath.row].roundTo) \(changeSign[indexPath.row])")
            self.title = "Курсы валют ЦБ РФ на \(timestamp)"
        }
        return cell
    }
    
}
