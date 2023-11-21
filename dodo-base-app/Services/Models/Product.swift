//
//  Product.swift
//  dodo-app
//
//  Created by Anastasia on 30.08.23.
//
import Foundation

struct Product {
    var name: String
    var detail: String
    var price: Double
    var image: String
    var specialOffer: String?
    
    var priceTitle: String {
        return "from \(price) $"
    }
}
