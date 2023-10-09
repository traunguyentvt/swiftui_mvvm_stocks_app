//
//  Stock.swift
//  Stocks
//
//  Created by VT on 10/6/23.
//

import Foundation

struct Stock: Codable {
    let symbol: String
    let description: String
    let price: Double
    let change: String
}
