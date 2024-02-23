//
//  Cell.swift
//  HomeWork3_5
//
//  Created by Amina TomasMart on 20.02.2024.
//
import UIKit

class Cell: UICollectionViewCell {
    
    static let reuseID = "Cell"
    
    lazy var myImage: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        return $0
    }(UIImageView(frame: bounds))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(myImage)
    }
    
    func setImage(imageData: Data){
        let image = UIImage(data: imageData)
        myImage.image = image
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

