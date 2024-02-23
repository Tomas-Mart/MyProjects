// CoctailsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

///
final class CoctailsViewController: UIViewController {
    // MARK: - Private Constants

    private enum Constants {
        static let urlFailureText = "urlFailure"
        static let unknownFailureText = "Unknown error"
        static let decodingFailureText = "decodingFailure"
        static let coctailTableCellIdentifier = "CoctailTableViewCell"
    }

    // MARK: - Private Outlets

    private var coctailsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: - Private Properties

    let networkService: NetworkServiceProtocol
    let imageService: ImageServiceProtocol
    var drinks: [Drink] = []
    var ingredients: [String] = []

    // MARK: - Initializers

    init(networkService: NetworkServiceProtocol, imageService: ImageServiceProtocol) {
        self.networkService = networkService
        self.imageService = imageService
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        coctailsTableViewConstraint()
        fetchDrink()
    }

    // MARK: - Private Methods

    private func configureTableView() {
        view.addSubview(coctailsTableView)
        coctailsTableView.dataSource = self
        coctailsTableView.delegate = self
        coctailsTableView.register(
            CoctailTableViewCell.self,
            forCellReuseIdentifier: Constants.coctailTableCellIdentifier
        )
    }

    private func fetchDrink() {
        networkService.fetchCoctails { [weak self] result in
            guard let self else { return }
            switch result {
            case let .success(data):
                self.drinks = data
                self.coctailsTableView.reloadData()
            case .failure(.decodingFailure):
                print(Constants.decodingFailureText)
            case .failure(.urlFailure):
                print(Constants.urlFailureText)
            case .failure(.unknown):
                print(Constants.unknownFailureText)
            }
        }
    }

    private func goToIngredientVC(index: Int) {
        let id = drinks[index].id
        let ingredientsViewController = Assembly.makeIngredientsViewController(id: id)
        present(ingredientsViewController, animated: true)
    }

    // MARK: - Constrains

    private func coctailsTableViewConstraint() {
        NSLayoutConstraint.activate([
            coctailsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            coctailsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            coctailsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            coctailsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

/// UITableViewDataSource
extension CoctailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        drinks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.coctailTableCellIdentifier)
            as? CoctailTableViewCell
        else { return UITableViewCell() }
        let drink = drinks[indexPath.row]
        cell.configure(drink: drink, imageService: imageService)
        return cell
    }
}

/// UITableViewDelegate
extension CoctailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        goToIngredientVC(index: indexPath.row)
    }
}
