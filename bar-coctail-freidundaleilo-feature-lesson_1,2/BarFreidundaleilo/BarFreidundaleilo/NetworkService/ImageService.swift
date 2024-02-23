// ImageService.swift
// Copyright © RoadMap. All rights reserved.

import Alamofire
import Foundation

/// Сервис загрузки изображений
protocol ImageServiceProtocol {
    func fetchImage(imageUrlPath: String, handler: @escaping (Result<Data, NetworkError>) -> ())
}

/// Загрузка изображений
final class ImageService: ImageServiceProtocol {
    // MARK: - Public Method

    func fetchImage(imageUrlPath: String, handler: @escaping (Result<Data, NetworkError>) -> ()) {
        AF.request(imageUrlPath).responseData { response in
            switch response.result {
            case let .success(data):
                handler(.success(data))
            case let .failure(error):
                handler(.failure(.decodingFailure))
            }
        }
    }
}
