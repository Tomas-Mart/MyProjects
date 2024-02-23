//
//  BannerCell.swift
//  p5m2_12
//
//  Created by Amina TomasMart on 16.02.2024.
//

import UIKit

class BannerCell: UICollectionViewCell {
    
    lazy var image: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 25
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    lazy var title: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(image)
        addSubview(title)
        backgroundColor = .systemGray6
        layer.cornerRadius = 20
        setConstraints()
    }
    
    func setCell(data: Item) {
        image.image = UIImage(named: data.photo)
        title.text = data.text
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            image.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            image.widthAnchor.constraint(equalToConstant: 50),
            image.heightAnchor.constraint(equalToConstant: 50),
            
            title.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            title.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 20),
            title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            title.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
