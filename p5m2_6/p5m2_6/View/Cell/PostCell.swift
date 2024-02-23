//
//  PostCell.swift
//  p5m2_6
//
//  Created by Amina TomasMart on 05.02.2024.
//

import UIKit

final class PostCell: UITableViewCell {
    
    static let reuseID = "cell"
    var block: (() -> ())?
    var block2: (() -> ())?

    
    private lazy var cellView: UIView = {
        .config($0) {
            $0.backgroundColor = .systemGray6
            $0.layer.cornerRadius = 15
            $0.addSubview(nameLabel)
            $0.addSubview(hStack)
            $0.addSubview(image)
            $0.addSubview(text)
            $0.addSubview(button)
        }
    }(UIView())
    
    private lazy var icon1: UIButton = {
        .config2($0) {
            $0.setImage(UIImage(named: "3"), for: .normal)
        }
    }(UIButton(primaryAction: actionIcon))
    
    private lazy var icon2: UIButton = {
        .config2($0) {
            $0.setImage(UIImage(named: "4"), for: .normal)
        }
    }(UIButton(primaryAction: actionIcon))
    
    private lazy var actionIcon = UIAction { [weak self] _ in
        self?.block2?()
    }
    
    private lazy var hStack: UIStackView = {
        .config($0) {
            $0.axis = .horizontal
            $0.spacing = 15
            $0.addArrangedSubview(icon1)
            $0.addArrangedSubview(icon2)
        }
    }(UIStackView())
    
    private lazy var nameLabel: UILabel = {
        .config($0) {
            $0.numberOfLines = 0
            $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            $0.textColor = .black
        }
    }(UILabel())
    
    private lazy var image: UIImageView = {
        .config($0) {
            $0.layer.cornerRadius = 15
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
        }
    }(UIImageView())
    
    private lazy var text: UILabel = {
        .config($0) {
            $0.numberOfLines = 0
            $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            $0.textColor = .black
        }
    }(UILabel())
    
    private lazy var button: UIButton = {
        .config($0) {
            $0.backgroundColor = #colorLiteral(red: 0, green: 0.6133130193, blue: 0.3524134159, alpha: 1)
            $0.setTitle("Подробнее", for: .normal)
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            $0.setTitleColor(.white, for: .normal)
            $0.layer.cornerRadius = 20
        }
    }(UIButton(primaryAction: action))
    
    private lazy var action = UIAction { [weak self] _ in
        self?.block?()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
    }
    
    override func prepareForReuse() {
        image.constraints.forEach { cnstr in
            image.removeConstraints([cnstr])
        }
    }
    
    func configCell(data: TableData) {
        contentView.addSubview(cellView)
        nameLabel.text = data.name
        image.image = UIImage(named: data.photo)
        text.text = data.text
        let ratio = (image.image?.size.height ?? 0) / (image.image?.size.width ?? 0)
        let imageH = (self.frame.width-20) * ratio
        
        NSLayoutConstraint.activate([
        
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            image.topAnchor.constraint(equalTo: cellView.topAnchor),
            image.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 10),
            image.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -10),
            image.heightAnchor.constraint(equalToConstant: imageH),
            
            nameLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 15),
            nameLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20),
            
            hStack.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 15),
            hStack.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -20),
            
            text.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 25),
            text.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 10),
            text.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -10),
            
            button.topAnchor.constraint(equalTo: text.bottomAnchor, constant: 20),
            button.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 10),
            button.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -10),
            button.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -15),
            button.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
