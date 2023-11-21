//
//  Ingredient.swift
//  dodo-app
//
//  Created by Anastasia on 21.09.23.
//

import Foundation

struct Ingredient {
    var name: String
    var image: String
    var price: Int
    
    var priceTitle: String {
        return "\(price) $"
    }
}
