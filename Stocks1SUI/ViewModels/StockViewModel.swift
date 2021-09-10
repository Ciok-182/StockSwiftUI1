//
//  StockViewModel.swift
//  Stocks1SUI
//
//  Created by Jorge Encinas on 06/09/21.
//

import Foundation

struct StockViewModel {
    
    let stock: Stock
    
    var symbol: String{
        return stock.symbol.uppercased()
    }
    
    var description: String{
        return stock.description.uppercased()
    }
    
    var price: String{
        return String(format: "%.2f" , stock.price)
    }
    
    var change: String{
        return stock.change
    }
    
    
    
}

