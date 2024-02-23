//
//  Item.swift
//  p5m3_3
//
//  Created by Amina TomasMart on 18.02.2024.
//

import Foundation

struct Item: Decodable {
    let width: Int
    let height: Int
    let urls: Urls
}

struct Urls: Decodable {
    let small: String?
    let thumb: String?
}
