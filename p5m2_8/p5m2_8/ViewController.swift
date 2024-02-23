//
//  ViewController.swift
//  p5m2_8
//
//  Created by Amina TomasMart on 08.02.2024.
//

import UIKit

final class ViewController: UIViewController {
    
    private let images: [UIImage] = [._1, ._2, ._3]
    
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
        $0.register(Header.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
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
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionCell.reuseID, for: indexPath) as? CollectionCell else {return UICollectionViewCell()
        }
        cell.setCollectionCell(image: images[indexPath.item])
        cell.block = { [weak self] in
            let vc = WebViewController()
            self?.navigationController?.pushViewController(vc, animated: true)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let headerCell = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header", for: indexPath) as? Header
            headerCell?.setHeader()
            return headerCell ?? UICollectionReusableView()
        }
        
        return UICollectionReusableView()
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = WebViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
