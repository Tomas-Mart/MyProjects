//
//  RoomVC.swift
//  TestHotel
//
//  Created by Amina TomasMart on 23.12.2023.
//

import UIKit

class RoomVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var myImages = ["1", "2", "3"]
    var myPage = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myPage.numberOfPages = myImages.count
        myPage.currentPage = 0
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        myPage.currentPage = indexPath.item
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myImages.count
    }
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCell
        cell.image.image = UIImage(named: myImages[indexPath.item])
        cell.image.layer.cornerRadius = 15
        return cell
    }
}
class MyCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var page: UIPageControl!
}
