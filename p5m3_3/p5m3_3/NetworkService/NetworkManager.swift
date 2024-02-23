//
//  NetworkManager.swift
//  p5m3_3
//
//  Created by Amina TomasMart on 18.02.2024.
//

import Foundation
import Alamofire

class NetworkManager {
    
    func getImagesFromUnsplash(complecion: @escaping ([Item]?) -> ()) {
        let param: Parameters = [
            "orientation": "landscape",
            "content_filter": "high",
            "count": 30,
            "client_id": "X6w0Qo2snXgTRFiL4drJxRY0h89biy92cwTrQjUXX2k"
        ]
        
        AF.request("https://api.unsplash.com/photos/random", method: .get, parameters: param).response { res in
            guard res.error == nil, let data = res.data else {return}
            
            let images = try? JSONDecoder().decode([Item].self, from: data)
            complecion(images)
        }
    }
    
    func searchPhotoInQuery(query: String) {
        print(query)
    }
}
