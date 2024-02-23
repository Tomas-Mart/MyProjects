//
//  StorageManager.swift
//  p5m3_4
//
//  Created by Amina TomasMart on 19.02.2024.
//

import Foundation

class StorageManager {
    
    func urlPath() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    func saveImage(imageData: Data) {
        var path = urlPath()
        path.append(path: "user1")
        try? FileManager.default.createDirectory(at: path, withIntermediateDirectories: true)
        path.append(path: "img2.jpg")
        do {
            try imageData.write(to: path)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadImage(fileName: String) -> Data {
        var path = urlPath()
        path.append(path: fileName)
        if let imageData = try? Data(contentsOf: path) {
            return imageData
        } else {
            return Data()
        }
    }
}
