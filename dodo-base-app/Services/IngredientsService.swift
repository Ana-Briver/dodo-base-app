//
//  IngredientsService.swift
//  dodo-app
//
//  Created by Anastasia on 21.09.23.
//

import Foundation

class IngredientsService {
    private let ingredients: [Ingredient] = [
        Ingredient(name: "Cheese", image: "cheese", price: 2),
        Ingredient(name: "Onions", image: "onion", price: 3),
        Ingredient(name: "Cherrytomaten", image: "cherry_tomato", price: 15),
        Ingredient(name: "Cheese 2", image: "cheese", price: 2),
        Ingredient(name: "Onions 2", image: "onion", price: 3),
        Ingredient(name: "Cherrytomaten 2", image: "cherry_tomato", price: 15),
        Ingredient(name: "Cheese 3", image: "cheese", price: 2),
        Ingredient(name: "Onions 3", image: "onion", price: 3),
        Ingredient(name: "Sauce", image: "sauce_1", price: 2),
        Ingredient(name: "Sauce", image: "sauce_2", price: 3),
        Ingredient(name: "Sauce", image: "sauce_3", price: 15),
        Ingredient(name: "Sauce", image: "sauce_4", price: 2),
        Ingredient(name: "Sauce", image: "sauce_5", price: 3),
        Ingredient(name: "Cherrytomaten 2", image: "cherry_tomato", price: 15),
        Ingredient(name: "Cheese 3", image: "cheese", price: 2),
        Ingredient(name: "Onions 3", image: "onion", price: 3)
    ]
    
    func fetchIngredients() -> [Ingredient] {
        return ingredients
    }
}
