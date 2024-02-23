//
//  Model.swift
//  HomeWork3_2
//
//  Created by Amina TomasMart on 17.02.2024.
//

import Foundation

class Service {
    
    // https://run.mocky.io/v3/75000507-da9a-43f8-a618-df698ea7176d
    // https
    // run.mocky.io
    // /v3/75000507-da9a-43f8-a618-df698ea7176d
    
    
    func getNews(completion: @escaping (Details) -> ()) {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "run.mocky.io"
        urlComponents.path = "/v3/75000507-da9a-43f8-a618-df698ea7176d"
        
        guard let url = urlComponents.url else {return}
        let req = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: req) { data, response, error in
            guard error == nil, let resData = data else {
                print(error!.localizedDescription)
                return
            }
            
            do {
                let result = try JSONDecoder().decode(Hotels.self, from: resData)
                completion(result.about_the_hotel)
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
}

struct Hotels: Decodable {
    let id: Int?
    let name: String?
    let adress: String?
    let minimal_price: Int?
    let price_for_it: String?
    let rating: Int?
    let rating_name: String?
    let image_urls: [String]?
    let about_the_hotel: Details
}

struct Details: Decodable {
    let description: String?
    let peculiarities: [String]?
}

