//
//  CollectionCell.swift
//  p5m2_8
//
//  Created by Amina TomasMart on 08.02.2024.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    
    static let reuseID = "CollectionCell"
    var block: (() -> ())?
    
    
    
    lazy var cellView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .systemGray6
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
        $0.addSubview(name)
        $0.addSubview(imageView)
        $0.addSubview(text)
        $0.addSubview(url)
        return $0
    }(UIView())
    
    
    lazy var name: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 0
        $0.text = "Заголовок ячейки"
        $0.font = UIFont.systemFont(ofSize: 20, weight: .black)
        return $0
    }(UILabel())
    
    lazy var imageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    lazy var text: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 0
        $0.text = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return $0
    }(UILabel())
    
    private lazy var url: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("https://error-nil.namari.ru", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        $0.setTitleColor(.blue, for: .normal)
        return $0
    }(UIButton(primaryAction: action))
    
    private lazy var action = UIAction { [weak self] _ in
        self?.block?()
    }
    
    func setCollectionCell(image: UIImage) {
        contentView.addSubview(cellView)
        imageView.image = image
        
        NSLayoutConstraint.activate([
            
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            cellView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width-40),
            
            name.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 20),
            name.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 40),
            name.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -40),
            
            imageView.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -10),
            imageView.heightAnchor.constraint(equalToConstant: 250),
            
            text.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
            text.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 40),
            text.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -40),
            
            url.topAnchor.constraint(equalTo: text.bottomAnchor, constant: 10),
            url.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 40),
            url.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -20)
        ])
    }
}
