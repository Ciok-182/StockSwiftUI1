//
//  StockListView.swift
//  Stocks1SUI
//
//  Created by Jorge Encinas on 06/09/21.
//

import SwiftUI

struct StockListView: View {
    
    
    let stocks: [StockViewModel]
    var body: some View {

        List(self.stocks, id: \.symbol){ stock in
            StockCellView(stock: stock)
        }
        .background(Color.black.ignoresSafeArea())
        //.colorMultiply(Color.black)
        .listRowBackground(Color.green)
        .onAppear {
            // Set the default to clear
            UITableView.appearance().backgroundColor = .clear
            UITableViewCell.appearance().tintColor = .black
            UITableViewCell.appearance().backgroundColor = .cyan
        }
    }
}


struct StockCellView: View {
    
    let stock: StockViewModel
    
    var body: some View{
        HStack{
            VStack(alignment: .leading){
                Text(stock.symbol)
                    .font(.custom("Arial", size: 22))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                    .background(Color.black)
                Text(stock.description)
                    .font(.custom("Arial", size: 18))
                    .foregroundColor(.gray)
            }
            Spacer()
            VStack{
                Text(stock.price)
                    .font(.custom("Arial", size: 22))
                    .foregroundColor(.gray)
                Button(stock.change){
                    
                }.frame(width: 75)
                .padding(1)
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(6)
            }
        }.background(Color.yellow)
    }
}

struct StickListView_Previews: PreviewProvider {
    
    
    
    static var previews: some View {
        let stock = Stock(symbol: "Ciok", description: "Siok Test", price: 1200, change: "+0.33")
        
        return StockListView(stocks: [StockViewModel(stock: stock)])
            //.preferredColorScheme(.dark)
    }
}
