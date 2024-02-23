//
//  CollectionViewController.swift
//  DemoScroll
//
//  Created by Amina TomasMart on 29.01.2024.
//

import UIKit

class CollectionViewController: UIViewController {
    
    var images = ["1", "2", "3", "4", "5", "1", "2", "3", "4", "5", "1", "2", "3", "4", "5", "1", "2", "3", "4", "5", "1", "2", "3", "4", "5", "1", "2", "3", "4", "5", "1", "2", "3", "4", "5", "1", "2", "3", "4", "5"]
    var labels = ["Снежинка", "Пушинка", "Солнышко", "Звездочка", "Милашка", "Снежинка", "Пушинка", "Солнышко", "Звездочка", "Милашка", "Снежинка", "Пушинка", "Солнышко", "Звездочка", "Милашка", "Снежинка", "Пушинка", "Солнышко", "Звездочка", "Милашка", "Снежинка", "Пушинка", "Солнышко", "Звездочка", "Милашка", "Снежинка", "Пушинка", "Солнышко", "Звездочка", "Милашка", "Снежинка", "Пушинка", "Солнышко", "Звездочка", "Милашка", "Снежинка", "Пушинка", "Солнышко", "Звездочка", "Милашка"]
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
}

extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return labels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MovieCollectionViewCell
        cell.movieLabel.text = labels[indexPath.item]
        cell.movieImage.image = UIImage(named: images[indexPath.item])
        cell.layer.borderWidth = 2
        cell.layer.cornerRadius = 2
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.width - 40) / 3
        
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10
        
    }
}
