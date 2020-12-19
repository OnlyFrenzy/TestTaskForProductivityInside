//
//  CurrencyJsonResponce.swift
//  currencyConverter
//
//  Created by OnlyFrenzy on 17.12.2020.
//

import Foundation


struct CurrencyJsonResponce: Codable  {
    let valute: [String: ValuteInformation]
    
    enum CodingKeys: String, CodingKey {
        case valute = "Valute"
    }
}


struct ValuteInformation: Codable {
    let charCode: String?
    let name: String?
    let nominal: Double?
    let value: Double?
    
    enum CodingKeys: String, CodingKey {
        case charCode = "CharCode"
        case name = "Name"
        case nominal = "Nominal"
        case value = "Value"
    }
}

