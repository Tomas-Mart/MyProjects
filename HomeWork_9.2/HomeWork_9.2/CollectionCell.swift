//
//  CollectionCell.swift
//  HomeWork_9.2
//
//  Created by Amina TomasMart on 12.02.2024.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    
    static let reuseID = "CollectionCell"
    
    lazy var cellView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .systemGray6
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
        $0.addSubview(image)
        return $0
    }(UIView())
    
    lazy var image: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    func setCollectionCell(data: CollectionData) {
        contentView.addSubview(cellView)
        image.image = UIImage(named: data.photo)
        
        NSLayoutConstraint.activate([
            
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            cellView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width-40),
            
            image.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 10),
            image.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 10),
            image.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -10),
            image.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -10),
            image.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height-200)
            
        ])
    }
}
