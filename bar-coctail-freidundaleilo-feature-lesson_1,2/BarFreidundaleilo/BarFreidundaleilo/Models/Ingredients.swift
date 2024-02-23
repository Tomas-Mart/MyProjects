// Ingredients.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Ингредиенты
struct Ingredients: Decodable {
    /// Ингредиент № 1
    let ingredientOne: String?
    /// Ингредиент № 2
    let ingredientTwo: String?
    /// Ингредиент № 3
    let ingredientThree: String?
    /// Ингредиент № 4
    let ingredientFour: String?
    /// Ингредиент № 5
    let ingredientFive: String?
    /// Ингредиент № 6
    let ingredientSix: String?
    /// Ингредиент № 7
    let ingredientSeven: String?
    /// Ингредиент № 8
    let ingredientEight: String?
    /// Ингредиент № 9
    let ingredientNine: String?
    /// Ингредиент № 10
    let ingredientTen: String?
    /// Ингредиент № 11
    let ingredientEleven: String?
    /// Ингредиент № 12
    let ingredientTwelve: String?
    /// Ингредиент № 13
    let ingredientThirteen: String?
    /// Ингредиент № 14
    let ingredientFourteen: String?
    /// Ингредиент № 15
    let ingredientFifteen: String?

    enum CodingKeys: String, CodingKey {
        case ingredientOne = "strIngredient1"
        case ingredientTwo = "strIngredient2"
        case ingredientThree = "strIngredient3"
        case ingredientFour = "strIngredient4"
        case ingredientFive = "strIngredient5"
        case ingredientSix = "strIngredient6"
        case ingredientSeven = "strIngredient7"
        case ingredientEight = "strIngredient8"
        case ingredientNine = "strIngredient9"
        case ingredientTen = "strIngredient10"
        case ingredientEleven = "strIngredient11"
        case ingredientTwelve = "strIngredient12"
        case ingredientThirteen = "strIngredient13"
        case ingredientFourteen = "strIngredient14"
        case ingredientFifteen = "strIngredient15"
    }

    /// Список ингредиентов
    func allIngredients() -> [String] {
        let mirror = Mirror(reflecting: self)
        var ingredients: [String] = []
        for (_, value) in mirror.children {
            guard let stringValue = value as? String else { continue }
            ingredients.append(stringValue)
        }
        return ingredients
    }
}
