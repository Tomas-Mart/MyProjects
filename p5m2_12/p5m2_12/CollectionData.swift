//
//  CollectionData.swift
//  p5m2_12
//
//  Created by Amina TomasMart on 15.02.2024.
//

import Foundation

struct Section: Hashable {
    var type: String
    var header: String
    var items: [Item]
}

struct Item: Hashable {
    var name:String
    var text: String
    var photo: String
}

class MockData {
    static func getData() -> [Section] {
        
        let sectionOneItems = [
            Item(name: "Name1", text: "", photo: "1"),
            Item(name: "Name2", text: "", photo: "2"),
            Item(name: "Name3", text: "", photo: "3"),
            Item(name: "Name4", text: "", photo: "4"),
            Item(name: "Name5", text: "", photo: "5"),
            Item(name: "Name6", text: "", photo: "6")
        ]
        
        let sectionTwoItems = [
            Item(name: "Name1", text: "", photo: "1"),
            Item(name: "Name2", text: "", photo: "2"),
            Item(name: "Name3", text: "", photo: "3")
            
        ]
        
        let sectionThreeItems = [
            Item(name: "Name1", text: "Текст ячейки", photo: "1"),
            Item(name: "Name2", text: "Текст ячейки", photo: "2"),
            Item(name: "Name3", text: "Текст ячейки", photo: "3"),
            Item(name: "Name4", text: "Текст ячейки", photo: "4"),
            Item(name: "Name5", text: "Текст ячейки", photo: "5"),
            Item(name: "Name6", text: "Текст ячейки", photo: "6"),
            Item(name: "Name1", text: "Текст ячейки", photo: "1"),
            Item(name: "Name2", text: "Текст ячейки", photo: "2"),
            Item(name: "Name3", text: "Текст ячейки", photo: "3")
        ]
        
        let sectionFourItems = [
            Item(name: "Name1", text: "", photo: "1"),
            Item(name: "Name2", text: "", photo: "2"),
            Item(name: "Name3", text: "", photo: "3")
            
        ]
        
        let sectionOne = Section(type: "story", header: "Friends", items: sectionOneItems)
        let sectionTwo = Section(type: "friends", header: "Friends", items: sectionTwoItems)
        let sectionThree = Section(type: "banner", header: "Friends", items: sectionThreeItems)
        let sectionFour = Section(type: "banner", header: "Friends", items: sectionFourItems)
        
        return [sectionOne, sectionTwo, sectionThree, sectionFour]
    }
}
