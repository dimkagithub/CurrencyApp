//
//  GetRates.swift
//  CurrencyApp
//
//  Created by Дмитрий on 26.12.2020.
//

import Foundation

var timestamp = String()
var currencyCharCode = [String]()
var currencyNominal = [Int]()
var currencyName = [String]()
var currencyValue = [Double]()
var valueChange = [Double]()
var changeSign = [String]()

func getRates() {
    let urlString = "https://www.cbr-xml-daily.ru/daily_json.js"
    guard let url = URL(string: urlString) else {
        print ("Нет соединения с интернет")
        return
    }
    URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let data = data else { return }
        guard error == nil else { return }
        do {
            let information = try JSONDecoder().decode(Information.self, from: data)
            let dateFormatterGet = DateFormatter()
            dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            let dateFormatterPrint = DateFormatter()
//            dateFormatterPrint.dateFormat = "dd.MM.yyyy, HH:mm"
            dateFormatterPrint.dateFormat = "dd.MM.yyyy"
            let date: Date? = dateFormatterGet.date(from: information.timestamp)
            timestamp = dateFormatterPrint.string(from: (date!))
            for currency in information.valute.values {
                let changes = (currency.value - currency.previous).roundTo
                let sign = changes < 0 ? "▼" : "▲"
                currencyCharCode.append(currency.charCode)
                currencyNominal.append(currency.nominal)
                currencyName.append(currency.name)
                currencyValue.append(currency.value)
                changeSign.append(sign)
            }
        } catch let error {
            print(error)
        }
    }.resume()
}

extension Double {
var roundTo: Double { (self * 100).rounded() / 100 }
}
