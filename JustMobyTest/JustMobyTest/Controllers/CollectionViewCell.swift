//
//  CollectionViewCell.swift
//  JustMobyTest
//
//  Created by Evgenii Lukin on 20.12.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    let heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        heroImageView.layer.cornerRadius = heroImageView.frame.width / 6
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        backgroundColor = .none
        addSubview(heroImageView)
    }
    
    //MARK: - SetConstraints
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            
            heroImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            heroImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            heroImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            heroImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
}
