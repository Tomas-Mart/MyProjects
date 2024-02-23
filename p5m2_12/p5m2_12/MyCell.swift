//
//  MyCell.swift
//  p5m2_12
//
//  Created by Amina TomasMart on 16.02.2024.
//

import UIKit

class MyCell: UICollectionViewCell {
    
    lazy var image: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(image)
        backgroundColor = .systemGray6
        layer.cornerRadius = 20
        setConstraints()
    }
    
    func setCell(image: String) {
        self.image.image = UIImage(named: image)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor),
            image.leadingAnchor.constraint(equalTo: leadingAnchor),
            image.trailingAnchor.constraint(equalTo: trailingAnchor),
            image.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
