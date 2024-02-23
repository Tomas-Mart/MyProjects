// NetworkService.swift
// Copyright © RoadMap. All rights reserved.

import Alamofire
import Foundation

/// Протокол Сетевых запросов
protocol NetworkServiceProtocol: DrinkServiceProtocol, IngredientServiseProtocol {}

/// Протокол получения напитков
protocol DrinkServiceProtocol {
    func fetchCoctails(handler: @escaping (Result<[Drink], NetworkError>) -> ())
}

/// Протокол  получения ингредиентов
protocol IngredientServiseProtocol {
    func fetchIngredients(coctailId: String, handler: @escaping (Result<[Ingredients], NetworkError>) -> ())
}

/// Сетевые запросы
class NetworkService: NetworkServiceProtocol {
    // MARK: - Private Constants

    private enum Constants {
        static let baseUrl = "https://www.thecocktaildb.com"
        static let allCoctailPath = "/api/json/v1/1/filter.php"
        static let ingredientsPath = "/api/json/v1/1/lookup.php?"
        static let categoryName = "c"
        static let categoryValue = "Cocktail"
        static let ingredientsName = "i"
    }

    // MARK: - Private Properties

    private let requestCoctailParameters: Parameters = [
        Constants.categoryName: Constants.categoryValue
    ]

    // MARK: - Public Method

    func fetchCoctails(handler: @escaping (Result<[Drink], NetworkError>) -> ()) {
        let baseURL = Constants.baseUrl
        let path = Constants.allCoctailPath
        guard let url = URL(string: "\(baseURL)\(path)") else {
            handler(.failure(.urlFailure))
            return
        }
        AF.request(url, parameters: requestCoctailParameters).responseData { response in
            guard let data = response.data else { return }
            do {
                let response = try JSONDecoder().decode(Drinks<Drink>.self, from: data)
                handler(.success(response.drinks))
            } catch {
                handler(.failure(.decodingFailure))
            }
        }
    }

    func fetchIngredients(coctailId: String, handler: @escaping (Result<[Ingredients], NetworkError>) -> ()) {
        let baseURL = Constants.baseUrl
        let path = Constants.ingredientsPath
        guard let url = URL(string: "\(baseURL)\(path)") else {
            handler(.failure(.urlFailure))
            return
        }
        AF.request(url, parameters: [Constants.ingredientsName: coctailId]).responseData { response in
            guard let data = response.data else { return }
            do {
                let response = try JSONDecoder().decode(Drinks<Ingredients>.self, from: data)
                handler(.success(response.drinks))
            } catch {
                handler(.failure(.decodingFailure))
            }
        }
    }
}
