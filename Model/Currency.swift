//
//  Currency.swift
//  CurrencyApp
//
//  Created by Дмитрий on 26.12.2020.
//

import Foundation

struct Information: Codable {
    let date: String //Date
    let previousDate: String //Date
    let previousUrl: String
    let timestamp: String //Date
    let valute: [String: Currency]

    enum CodingKeys: String, CodingKey {
        case date = "Date"
        case previousDate = "PreviousDate"
        case previousUrl = "PreviousURL"
        case timestamp = "Timestamp"
        case valute = "Valute"
    }
}

struct Currency: Codable {
    let id: String
    let numCode: String
    let charCode: String
    let nominal: Int
    let name: String
    let value: Double
    let previous: Double

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case numCode = "NumCode"
        case charCode = "CharCode"
        case nominal = "Nominal"
        case name = "Name"
        case value = "Value"
        case previous = "Previous"
    }
}
