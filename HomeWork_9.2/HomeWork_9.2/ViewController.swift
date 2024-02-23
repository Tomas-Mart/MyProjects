//
//  ViewController.swift
//  HomeWork_9.2
//
//  Created by Amina TomasMart on 12.02.2024.
//

import UIKit

final class ViewController: UIViewController {
    
    private let collectionData: [CollectionData] = CollectionData.getCollectionData()
    
    private lazy var layout: UICollectionViewFlowLayout = {
        $0.scrollDirection = .vertical
        $0.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        return $0
    }(UICollectionViewFlowLayout())
    
    private lazy var collectionView: UICollectionView = {
        $0.dataSource = self
        $0.delegate = self
        $0.frame = view.bounds
        $0.backgroundColor = .white
        $0.register(CollectionCell.self, forCellWithReuseIdentifier: CollectionCell.reuseID)
        
        return $0
    }(UICollectionView(frame: .zero, collectionViewLayout: layout))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(collectionView)
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionCell.reuseID, for: indexPath) as? CollectionCell else {return UICollectionViewCell()
        }
        cell.setCollectionCell(data: collectionData[indexPath.item])
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = PhotoViewController()
        vc.data = self.collectionData[indexPath.item]
        navigationController?.pushViewController(vc, animated: true)
    }
}

