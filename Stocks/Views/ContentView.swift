//
//  ContentView.swift
//  Stocks
//
//  Created by VT on 10/6/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var stockViewModel = StocksViewModel(service: APIService())
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor.black
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UITableView.appearance().backgroundColor = UIColor.black
        UITableViewCell.appearance().backgroundColor = UIColor.black
        
        stockViewModel.load()
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .leading) {
                Color.black
                
//                Text("TVT")
//                    .font(.custom("Arial", size: 32))
//                    .fontWeight(.bold)
//                    .foregroundColor(.cyan)
//                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
//                    .offset(y: -400)
                
                SearchView(searchTerm: $stockViewModel.searchTerm)
                    .offset(y: -350)
//                    .padding()
                
                StockListView(stocks: stockViewModel.stocks)
//                    .padding()
                    .offset(y: 200)
                
                NewsArticleView(newsArticles: self.stockViewModel.news, onDragBegin: { value in
                    self.stockViewModel.dragOffset = value.translation
                }, onDragEnd: { value in
                    if value.translation.height <= 0 {
                        self.stockViewModel.dragOffset = CGSize(width: 0, height: 100)
                        
                    } else {
                        self.stockViewModel.dragOffset = CGSize(width: 0, height: 600)
                    }
                })
                    .offset(y: self.stockViewModel.dragOffset.height)
            }
            .navigationBarTitle("Stocks")
        }
        .edgesIgnoringSafeArea(Edge.Set(.bottom))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
