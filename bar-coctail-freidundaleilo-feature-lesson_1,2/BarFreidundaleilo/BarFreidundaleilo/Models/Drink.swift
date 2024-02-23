// Drink.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Напиток
struct Drink: Decodable {
    /// Название напитка
    let name: String
    /// Id напитка
    let id: String
    /// URL-путь картинки напитка
    let urlPath: String

    enum CodingKeys: String, CodingKey {
        case name = "strDrink"
        case id = "idDrink"
        case urlPath = "strDrinkThumb"
    }
}
