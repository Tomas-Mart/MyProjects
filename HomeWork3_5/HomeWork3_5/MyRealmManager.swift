//
//  Manager.swift
//  HomeWork3_5
//
//  Created by Amina TomasMart on 20.02.2024.
//
import Foundation
import RealmSwift

class MyRealmManager {
    
    let realm = try! Realm()
    var photos: [Album] = []
    
    init() {
        
        fetchPhoto()
    }
    
    func addPhoto(photoName: String) {
        let imagePhoto = Album()
        imagePhoto.imageName = photoName
        do {
            try realm.write ({
                realm.add(imagePhoto)
            })
        } catch {
            print(error.localizedDescription)
        }
        
        fetchPhoto()
    }
    
    func fetchPhoto() {
        let photos = realm.objects(Album.self)
        self.photos = Array(photos)
    }
}
