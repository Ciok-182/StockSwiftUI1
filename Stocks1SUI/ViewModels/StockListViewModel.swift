//
//  StockListViewModel.swift
//  Stocks1SUI
//
//  Created by Jorge Encinas on 06/09/21.
//

import Foundation

class StockListViewModel: ObservableObject {
    
    @Published var searchTerm: String = ""
    @Published var stocks: [StockViewModel] = [StockViewModel]()
    @Published var news: [NewsArticleViewModel] = [NewsArticleViewModel]()
    
    func load(){
        fetchStocks()
        fetchNews()
    }
    
    private func fetchStocks(){
        
        WebService().getStocks{ stocksWS in
            if let stocks = stocksWS {
                DispatchQueue.main.async {
                    self.stocks = stocks.map(StockViewModel.init)
                }
            }
        }
    }
    
    private func fetchNews(){
        WebService().getTopNews{ articlesWS in
            
            if let articles = articlesWS {
                DispatchQueue.main.async {
                    self.news = articles.map(NewsArticleViewModel.init)
                }
            }
            
        }
    }
}
