// Drinks.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Напитки
struct Drinks<T: Decodable>: Decodable {
    /// Напитки в баре
    let drinks: [T]
}
