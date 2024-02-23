//
//  Note.swift
//  p5m3_5
//
//  Created by Amina TomasMart on 19.02.2024.
//

import Foundation
import RealmSwift

class Folder: Object {
    @Persisted(primaryKey: true) var id = UUID().uuidString
    @Persisted var folderName: String = ""
    @Persisted var note: List<Note>
    
}

class Note: Object, Comparable {
    
    static func < (lhs: Note, rhs: Note) -> Bool {
        lhs.date < rhs.date
    }
    
    @Persisted(primaryKey: true) var id = UUID().uuidString
    @Persisted var title = ""
    @Persisted var noteText = ""
    @Persisted var date: Date = Date()
    @Persisted var image: String = ""
    @Persisted var surName: String = ""
    
    var isActive: Bool = false
}
