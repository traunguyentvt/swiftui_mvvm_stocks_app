//
//  StockListView.swift
//  Stocks
//
//  Created by VT on 10/7/23.
//

import SwiftUI

struct StockListView: View {
    let stocks: [Stock]
    
    var body: some View {
        List(self.stocks, id: \.symbol) { stock in
            StockViewCell(stock: stock)
        }
    }
}

struct StockListView_Previews: PreviewProvider {
    static var previews: some View {
        let stock = Stock(symbol: "APPL", description: "Apple Stocks", price: 7000, change: "+7.0")
        StockListView(stocks: [stock])
    }
}
