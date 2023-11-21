//
//  ProductsService.swift
//  dodo-app
//
//  Created by Anastasia on 30.08.23.
//

import Foundation

class ProductsService {
    private let products: [Product] = [
        Product(name: "Pepperoni", detail: "Cheese, Onion, Pepperoni, Cheese, Onion, Pepperoni, Cheese, Onion, Pepperoni", price: 8.5, image: "hawaii", specialOffer: "Special Deal"),
        Product(name: "Hawaii", detail: "Cheese, Pineapple", price: 10.5, image: "hawaii"),
        Product(name: "4 cheese", detail: "Cheese, Ham, Cheese, Ham, Cheese, Ham", price: 15.5, image: "4cheese", specialOffer: "New"),
        Product(name: "Pepperoni", detail: "Cheese, Onion, Pepperoni, Cheese, Onion, Pepperoni, Cheese, Onion, Pepperoni", price: 21.0, image: "hawaii", specialOffer: "New"),
    ]
    
    func fetchProducts() -> [Product] {
        return products
    }
}
