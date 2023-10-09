//
//  StockViewCell.swift
//  Stocks
//
//  Created by VT on 10/7/23.
//

import SwiftUI

struct StockViewCell: View {
    let stock: Stock
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(stock.symbol)
                    .font(.custom("Arial", size: 22))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                
                Text(stock.description)
                    .font(.custom("Arial", size: 18))
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            VStack {
                Text(String(format: "%.2f", stock.price))
                    .foregroundColor(.gray)
                    .font(.custom("Arial", size: 18))
                
                Button(stock.change) {
                    
                }
                .frame(width: 75)
                .padding(5)
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(6)
            }
        }
    }
}

struct StockViewCell_Previews: PreviewProvider {
    static var previews: some View {
        StockViewCell(stock: Stock(symbol: "APPL", description: "Apple Stocks", price: 7000, change: "+7.0"))
    }
}
