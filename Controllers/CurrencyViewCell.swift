//
//  CurrencyViewCell.swift
//  CurrencyApp
//
//  Created by Дмитрий on 26.12.2020.
//

import UIKit

class CurrencyViewCell: UITableViewCell {

    @IBOutlet weak var currencyCharCode: UILabel!
    @IBOutlet weak var currencyName: UILabel!
    @IBOutlet weak var currencyValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
