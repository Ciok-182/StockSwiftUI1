//
//  ContentView.swift
//  Stocks1SUI
//
//  Created by Jorge Encinas on 06/09/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var stockListVM = StockListViewModel()
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor.black
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UITableView.appearance().backgroundColor = UIColor.black
        UITableViewCell.appearance().backgroundColor = UIColor.black
        
        UITableView.appearance().backgroundColor = .clear
        UITableView.appearance().separatorStyle = .singleLine
        UITableViewCell.appearance().backgroundView?.backgroundColor = .blue
        UITableViewCell.appearance().backgroundColor = .green
        
        stockListVM.load()
    }
    
    var body: some View {
        
        let filter = self.stockListVM.searchTerm.isEmpty ? self.stockListVM.stocks : self.stockListVM.stocks.filter{ $0.symbol.starts(with: self.stockListVM.searchTerm) }
        
        return NavigationView{
            ZStack(alignment: .leading){
                //Color.gray.grayscale(0.5)
                Color.black
                Text("Septiembre 6 2021")
                    .font(.custom("Arial", size: 32))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    .offset(y: -260)
                
                SearchView(searchTerm: self.$stockListVM.searchTerm)
                    .offset(y: -210)
                
                StockListView(stocks: filter)
                    .offset(y: 260)
                
                NewsArticleView(newArticles: stockListVM.news)
                    .offset( y: 500)
            }
            //.edgesIgnoringSafeArea([.bottom, .top])
            .edgesIgnoringSafeArea(.all)
            //.edgesIgnoringSafeArea(Edge.Set(.bottom))
            .navigationBarTitle("Stocks")
            
        }.edgesIgnoringSafeArea(.all)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
