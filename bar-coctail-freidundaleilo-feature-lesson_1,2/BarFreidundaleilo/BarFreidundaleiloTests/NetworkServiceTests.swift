// NetworkServiceTests.swift
// Copyright © RoadMap. All rights reserved.

import Alamofire
@testable import BarFreidundaleilo
import XCTest

final class NetworkServiceTests: XCTestCase {
    let expectation = XCTestExpectation(description: "caf")

    func testDownloadAndParseCoctails() {
        let baseURL = "https://www.thecocktaildb.com"
        let path = "/api/json/v1/1/filter.php"
        guard let url = URL(string: "\(baseURL)\(path)") else {
            XCTFail("Некорректный URL")
            return
        }

        AF.request(url, parameters: ["c": "Cocktail"]).responseData { response in
            self.expectation.fulfill()
            guard let data = response.data else {
                XCTFail("Дата не получена")
                return
            }

            do {
                _ = try JSONDecoder().decode(Drinks<Drink>.self, from: data)
            } catch {
                XCTFail("Ошибка парсинга")
            }
        }
        wait(for: [expectation], timeout: 10)
    }

    func testDownloadAndParseIngredients() {
        let baseURL = "https://www.thecocktaildb.com"
        let path = "/api/json/v1/1/lookup.php?"
        guard let url = URL(string: "\(baseURL)\(path)") else {
            XCTFail("Некорректный URL")
            return
        }

        AF.request(url, parameters: ["i": "11007"]).responseData { response in
            self.expectation.fulfill()
            guard let data = response.data else {
                XCTFail("Дата не получена")
                return
            }

            do {
                _ = try JSONDecoder().decode(Drinks<Ingredients>.self, from: data)
            } catch {
                XCTFail("Ошибка парсинга")
            }
        }
        wait(for: [expectation], timeout: 10)
    }
}
