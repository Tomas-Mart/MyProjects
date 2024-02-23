// Assembly.swift
// Copyright © RoadMap. All rights reserved.

import Swinject
import UIKit

/// Сборка
final class Assembly {
    // MARK: - Private Constants

    private enum Constants {
        static let errorText = "resolve error"
    }

    // MARK: - Public Properties

    static var container: Container {
        let container = Container()
        container.register(NetworkServiceProtocol.self) { _ in
            NetworkService()
        }
        container.register(ImageServiceProtocol.self) { _ in
            ImageService()
        }

        container.register(CoctailsViewController.self) { resolver in
            guard let networkService = resolver.resolve(NetworkServiceProtocol.self),
                  let imageService = resolver.resolve(ImageServiceProtocol.self)
            else { fatalError(Constants.errorText) }
            let vc = CoctailsViewController(networkService: networkService, imageService: imageService)
            return vc
        }

        container.register(IngredientsViewController.self) { resolver in
            guard let service = resolver.resolve(NetworkServiceProtocol.self) else { fatalError(Constants.errorText) }
            let vc = IngredientsViewController(networkService: service, id: "")
            return vc
        }

        return container
    }

    // MARK: - Initializers

    init() {}

    static func makeIngredientsViewController(id: String) -> UIViewController {
        guard let networkService = container.resolve(NetworkServiceProtocol.self)
        else { fatalError(Constants.errorText) }
        let ingredientsViewController = IngredientsViewController(networkService: networkService, id: id)
        return ingredientsViewController
    }
}
