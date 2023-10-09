//
//  APIService.swift
//  Stocks
//
//  Created by VT on 10/6/23.
//

import Foundation

class APIService {
    
    func getTopNews(completion: @escaping ([Article]?) -> Void) {
        guard let url = URL(string: APIConstants.api_top_news) else {
            fatalError("URL is not correct")
        }
        URLSession.shared.dataTask(with: url) { data, urlResponse, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            let articles = try? JSONDecoder().decode([Article].self, from: data)
            DispatchQueue.main.async {
                completion(articles)
            }
        }
        .resume()
    }
    
    func getStocks(completion: @escaping ([Stock]?) -> Void) {
        guard let url = URL(string: APIConstants.api_stocks) else {
            fatalError("URL is incorrect")
        }
        URLSession.shared.dataTask(with: url) { data, urlResponse, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            let stocks = try? JSONDecoder().decode([Stock].self, from: data)
            DispatchQueue.main.async {
                completion(stocks)
            }
        }
        .resume()
    }
}
