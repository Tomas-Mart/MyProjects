//
//  ItemCell.swift
//  p5m3_3
//
//  Created by Amina TomasMart on 18.02.2024.
//

import UIKit
import SDWebImage

class ItemCell: UICollectionViewCell {
    
    static let reuseID = "ItemCell"
    
    lazy var image: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.frame = bounds
        return $0
    }(UIImageView())
    
    override func prepareForReuse() {
        image.image = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(image)
    }
    
    func setImage(imageUrl: String) {
        guard let url = URL(string: imageUrl) else {return}
        self.image.sd_setImage(with: url, placeholderImage: .checkmark)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
