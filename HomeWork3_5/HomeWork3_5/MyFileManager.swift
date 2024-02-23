//
//  FileManager.swift
//  HomeWork3_5
//
//  Created by Amina TomasMart on 20.02.2024.
//
import Foundation

class MyFileManager {
    
     func urlPath() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    func saveImage(imageName: String, imageData: Data) {
        var path = urlPath()
        path.append(path: "Album")
        try? FileManager.default.createDirectory(at: path, withIntermediateDirectories: true)
        path.append(path: imageName)
        do {
            try imageData.write(to: path)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadImage(fileName: String) -> Data {
        var path = urlPath()
        path.append(path: "Album")
        try? FileManager.default.createDirectory(at: path, withIntermediateDirectories: true)
        path.append(path: fileName)
        guard let imageData = try? Data(contentsOf: path) else {return Data()}
        return imageData
    }
}
