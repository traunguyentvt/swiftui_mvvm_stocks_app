//
//  StocksViewModel.swift
//  Stocks
//
//  Created by VT on 10/6/23.
//

import SwiftUI

class StocksViewModel: ObservableObject {
    private let service: APIService
    @Published var dragOffset: CGSize
    @Published var searchTerm: String
    @Published var stocks: [Stock]
    @Published var news: [Article]
    
    init(service: APIService) {
        self.service = service
        self.dragOffset = CGSize(width: 0, height: 600)
        self.searchTerm = ""
        self.stocks = []
        self.news = []
    }
    
    func load() {
        fetchNews()
        fetchStocks()
    }
    
    private func fetchNews() {
        self.service.getTopNews() { articles in
            if let articles = articles {
                DispatchQueue.main.async {
                    self.news = articles
                }
            }
        }
    }
    
    private func fetchStocks() {
        self.service.getStocks() { responses in
            if let list = responses {
                DispatchQueue.main.async {
                    self.stocks = list
                }
            }
        }
    }
}
