//
//  Stock.swift
//  Stocks1SUI
//
//  Created by Jorge Encinas on 06/09/21.
//

import Foundation

struct Stock: Decodable {
    let symbol: String
    let description: String
    let price: Double
    let change: String
}
