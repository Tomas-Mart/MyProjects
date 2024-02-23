// IngredientsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ингредиенты напитка
final class IngredientsViewController: UIViewController {
    // MARK: - Private Constants

    private enum Constants {
        static let ingredientTableCellIdentifier = "IngredientTableViewCell"
        static let urlFailureText = "urlFailure"
        static let unknownFailureText = "Unknown error"
        static let decodingFailureText = "decodingFailure"
    }

    // MARK: - Private Outlets

    private var ingredientsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: - Public Properties

    var id: String

    // MARK: - Private Properties

    private let networkService: NetworkServiceProtocol
    private var ingredients: [String] = []

    // MARK: - Initializers

    init(networkService: NetworkServiceProtocol, id: String) {
        self.networkService = networkService
        self.id = id
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        fetchIngredients()
    }

    // MARK: - Private Methods

    private func configureTableView() {
        view.addSubview(ingredientsTableView)
        ingredientsTableViewConstraint()
        ingredientsTableView.dataSource = self
        ingredientsTableView.register(
            IngredientTableViewCell.self,
            forCellReuseIdentifier: Constants.ingredientTableCellIdentifier
        )
    }

    private func fetchIngredients() {
        networkService.fetchIngredients(coctailId: id) { [weak self] result in
            guard let self else { return }
            switch result {
            case let .success(data):
                let ingredients = data.reduce([String]()) { $0 + $1.allIngredients() }
                self.ingredients = ingredients
                self.ingredientsTableView.reloadData()
            case .failure(.decodingFailure):
                print(Constants.decodingFailureText)
            case .failure(.urlFailure):
                print(Constants.urlFailureText)
            case .failure(.unknown):
                print(Constants.unknownFailureText)
            }
        }
    }

    // MARK: - Constrains

    private func ingredientsTableViewConstraint() {
        NSLayoutConstraint.activate([
            ingredientsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            ingredientsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            ingredientsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            ingredientsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

/// UITableViewDataSource
extension IngredientsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ingredients.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ingredientTableCellIdentifier)
            as? IngredientTableViewCell
        else { return UITableViewCell() }
        let ingredient = ingredients[indexPath.row]
        cell.configure(ingredient: ingredient)
        return cell
    }
}
