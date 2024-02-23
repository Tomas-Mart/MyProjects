//
//  CollectionData.swift
//  HomeWork_9.2
//
//  Created by Amina TomasMart on 12.02.2024.
//

import Foundation

struct CollectionData: Identifiable {
    let id: String = UUID().uuidString
    let photo: String
    
    static func getCollectionData() -> [CollectionData] {
        return [
            
            CollectionData(photo: "1"),
            
            CollectionData(photo: "2"),
            
            CollectionData(photo: "3")
            
        ]
    }
}
