//
//  MainView.swift
//  p5m3_3
//
//  Created by Amina TomasMart on 18.02.2024.
//
import UIKit

class MainView {
    
    var view: UIView
    var dataSource: UICollectionViewDataSource
    var delegate: UICollectionViewDelegate
    init(view: UIView, dataSource: UICollectionViewDataSource, delegate: UICollectionViewDelegate) {
        self.view = view
        self.dataSource = dataSource
        self.delegate = delegate
    }
    
    func createCollection() -> UICollectionView {
        let collectionView: UICollectionView = {
            let layout = $0.collectionViewLayout as! UICollectionViewFlowLayout
            layout.minimumLineSpacing = 10
            let size = view.bounds.width-40
            layout.itemSize = CGSize(width: size, height: size)
            $0.dataSource = dataSource
            $0.delegate = delegate
            $0.register(ItemCell.self, forCellWithReuseIdentifier: ItemCell.reuseID)
            return $0
        }(UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout()))
        return collectionView
    }
}
