// CoctailTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Ячейка коктейля
final class CoctailTableViewCell: UITableViewCell {
    // MARK: - Private Constants

    private enum Constants {
        static let errorText = "error"
        static let fontSize: CGFloat = 17
        static let nameLabelTopIndent: CGFloat = 45
        static let nameLabelBotIndent: CGFloat = -45
        static let nameLabelLeftIndent: CGFloat = 15
        static let nameLabelRightIndent: CGFloat = -15
        static let heightAndWidthImageView: CGFloat = 100
        static let coctailsImageViewTopIndent: CGFloat = 5
        static let coctailsImageViewBotIndent: CGFloat = -5
        static let coctailsImageViewLeftIndent: CGFloat = 15
    }

    // MARK: - Private Outlets

    private var coctailsImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private var coctailsNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: Constants.fontSize)
        return label
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addSubviews()
        configureLayoutAnchor()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func configure(drink: Drink, imageService: ImageServiceProtocol) {
        coctailsNameLabel.text = drink.name
        fetchImage(urlPath: drink.urlPath, imageService: imageService)
    }

    // MARK: - Private Methods

    private func addSubviews() {
        addSubview(coctailsImageView)
        addSubview(coctailsNameLabel)
    }

    private func fetchImage(urlPath: String, imageService: ImageServiceProtocol) {
        imageService.fetchImage(imageUrlPath: urlPath) { [weak self] result in
            guard let self else { return }
            switch result {
            case let .success(data):
                self.coctailsImageView.image = UIImage(data: data)
            default:
                print(Constants.errorText)
            }
        }
    }

    // MARK: - Constrains

    private func configureLayoutAnchor() {
        coctailsImageViewConstraint()
        coctailsNameLabelConstraint()
    }

    private func coctailsNameLabelConstraint() {
        NSLayoutConstraint.activate([
            coctailsNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.nameLabelTopIndent),
            coctailsNameLabel.leadingAnchor.constraint(
                equalTo: coctailsImageView.trailingAnchor,
                constant: Constants.nameLabelLeftIndent
            ),
            coctailsNameLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: Constants.nameLabelRightIndent
            ),
            coctailsNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.nameLabelBotIndent)

        ])
    }

    private func coctailsImageViewConstraint() {
        NSLayoutConstraint.activate([
            coctailsImageView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.coctailsImageViewTopIndent),
            coctailsImageView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Constants.coctailsImageViewLeftIndent
            ),
            coctailsImageView.heightAnchor.constraint(equalToConstant: Constants.heightAndWidthImageView),
            coctailsImageView.widthAnchor.constraint(equalToConstant: Constants.heightAndWidthImageView),
            coctailsImageView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: Constants.coctailsImageViewBotIndent
            )
        ])
    }
}
