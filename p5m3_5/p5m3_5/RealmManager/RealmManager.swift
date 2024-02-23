//
//  RealmManager.swift
//  p5m3_5
//
//  Created by Amina TomasMart on 19.02.2024.
//

import Foundation
import RealmSwift

class RealmManager {
    let realm = try! Realm()
    var folders: [Folder]?
    var notes: [Note]?
    
    init() {
        fetchFolder()
    }
    
    func addFolder(folderName: String){
        let folder = Folder()
        folder.folderName = folderName
        try! realm.write {
            realm.add(folder)
        }
        
        fetchFolder()
    }
    
    func fetchFolder() {
        let folders = realm.objects(Folder.self)
        self.folders = Array(folders)
    }
    
    func deleteFolder(folderID: String) {
        guard let folder = realm.object(ofType: Folder.self, forPrimaryKey: folderID) else {return}
        folder.note.forEach { note in
            try! realm.write {
                realm.delete(note)
            }
        }
        try! realm.write {
            realm.delete(folder)
        }
        fetchFolder()
    }
    
    func addNote(folderID: String, note: Note) {
        guard let folder = realm.object(ofType: Folder.self, forPrimaryKey: folderID) else {return}
        
        try! realm.write {
            folder.note.append(note)
        }
        
        fetchFolder()
    }
    
    func fetchNotes(folderID: String) {
        guard let folder = realm.object(ofType: Folder.self, forPrimaryKey: folderID) else {return}
        let notes = folder.note
        self.notes = Array(notes.sorted(by: >))
        fetchFolder()
    }
    
    func updateNote(id: String, newNote: Note) {
        guard let note = realm.object(ofType: Note.self, forPrimaryKey: id) else {return}
        try! realm.write {
            note.title = newNote.title
            note.noteText = newNote.noteText
            note.date = Date()
        }
    }
}
