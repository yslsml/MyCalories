//
//  CatalogFoodData.swift
//  Calories
//
//  Created by Milana Antonova on 23.05.22.
//

import SwiftUI

struct CatalogFood: Identifiable{
    let id = UUID()
    let name: String
    let calories: Double
}

struct CatalogFoodList {
    static let catalogFoodList = [
        CatalogFood(name: "Apple", calories: 45),
        CatalogFood(name: "Banana", calories: 90),
        CatalogFood(name: "Bread", calories: 265),
        CatalogFood(name: "Cabbage", calories: 30),
        CatalogFood(name: "Carrot", calories: 35),
        CatalogFood(name: "Cucumber", calories: 15),
        CatalogFood(name: "Champignons", calories: 30),
        CatalogFood(name: "Cheese", calories: 370),
        CatalogFood(name: "Cherry", calories: 50),
        CatalogFood(name: "Chocolate", calories: 550),
        CatalogFood(name: "Cookies", calories: 450),
        CatalogFood(name: "Egg", calories: 65),
        CatalogFood(name: "Fish", calories: 150),
        CatalogFood(name: "Ice creame", calories: 235),
        CatalogFood(name: "Juice", calories: 60),
        CatalogFood(name: "Mango", calories: 60),
        CatalogFood(name: "Meat", calories: 350),
        CatalogFood(name: "Milk", calories: 70),
        CatalogFood(name: "Orange", calories: 45),
        CatalogFood(name: "Pasta", calories: 350),
        CatalogFood(name: "Pancakes", calories: 215),
        CatalogFood(name: "Peach", calories: 45),
        CatalogFood(name: "Pear", calories: 50),
        CatalogFood(name: "Peanut", calories: 550),
        CatalogFood(name: "Potato", calories: 80),
        CatalogFood(name: "Porridge", calories: 110),
        CatalogFood(name: "Strawberry", calories: 35),
        CatalogFood(name: "Sausage", calories: 460),
        CatalogFood(name: "Tomato", calories: 25),
        CatalogFood(name: "Yogurt", calories: 50),
        CatalogFood(name: "Watermelon", calories: 25)
    ]
}

