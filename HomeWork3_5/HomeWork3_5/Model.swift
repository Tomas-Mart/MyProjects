//
//  Model.swift
//  HomeWork3_5
//
//  Created by Amina TomasMart on 20.02.2024.
//
import Foundation
import RealmSwift

class Album: Object {
    @Persisted(primaryKey: true) var id: String = UUID().uuidString
    @Persisted var imageName: String = ""
    @Persisted var date: Date = Date()
}
