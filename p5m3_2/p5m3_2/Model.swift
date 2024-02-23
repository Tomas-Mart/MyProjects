//
//  Model.swift
//  p5m3_2
//
//  Created by Amina TomasMart on 17.02.2024.
//

import Foundation

class Service {
    
    //https://newsapi.org/v2/everything?q=tesla&from=2024-01-17&sortBy=publishedAt&apiKey=API_KEY
    //    https
    //    newsapi.org
    //    v2/everything
    
    //    q=iphone
    //    pageSize=10
    //    language=ru
    //    apiKey=aff504f8cf6441a6aa23397d39a07323
    
    func getNews(q: String, count: Int, completion: @escaping ([NewsItem]) -> ()) {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "newsapi.org"
        urlComponents.path = "/v2/everything"
        
        urlComponents.queryItems = [
            URLQueryItem(name: "q", value: q),
            URLQueryItem(name: "pageSize", value: "\(count)"),
            URLQueryItem(name: "language", value: "ru"),
            URLQueryItem(name: "apiKey", value: "aff504f8cf6441a6aa23397d39a07323")
        ]
        
        guard let url = urlComponents.url else {return}
        print(url)
        var req = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: req) { data, response, error in
            guard error == nil, let resdata = data else {
                print(error!.localizedDescription)
                return
            }
            
            do {
                let result = try JSONDecoder().decode(News.self, from: resdata)
                completion(result.articles)
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
}

struct News: Decodable {
    
    let totalResults: Int
    let articles: [NewsItem]
}

struct NewsItem: Decodable {
    let source: Source
    let author: String?
    let title: String?
    let description: String?
    let urlToImage: String?
}

struct Source: Decodable {
    let name: String?
}
