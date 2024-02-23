// IngredientTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Ячейка ингредиента
final class IngredientTableViewCell: UITableViewCell {
    // MARK: - Private Constants

    private enum Constants {
        static let errorText = "error"
        static let fontSize: CGFloat = 16
        static let nameLabelTopIndent: CGFloat = 5
        static let nameLabelBotIndent: CGFloat = -5
        static let nameLabelLeftIndent: CGFloat = 15
        static let nameLabelRightIndent: CGFloat = -15
    }

    // MARK: - Private Outlets

    private var ingredientsNameLabel: UILabel = {
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
        coctailsNameLabelConstraint()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func configure(ingredient: String) {
        ingredientsNameLabel.text = ingredient
    }

    // MARK: - Private Methods

    private func addSubviews() {
        addSubview(ingredientsNameLabel)
    }

    // MARK: - Constrains

    private func coctailsNameLabelConstraint() {
        NSLayoutConstraint.activate([
            ingredientsNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.nameLabelTopIndent),
            ingredientsNameLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Constants.nameLabelLeftIndent
            ),
            ingredientsNameLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: Constants.nameLabelRightIndent
            ),
            ingredientsNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.nameLabelBotIndent)
        ])
    }
}
