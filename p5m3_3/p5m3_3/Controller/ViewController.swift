//
//  ViewController.swift
//  p5m3_3
//
//  Created by Amina TomasMart on 18.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var items: [Item]?
    private let network = NetworkManager()
    private lazy var viewBuilder: MainView = {
        return $0
    }(MainView(view: self.view, dataSource: self, delegate: self))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let collection = viewBuilder.createCollection()
        view.addSubview(collection)
        network.getImagesFromUnsplash { [weak self] items in
            self?.items = items
            DispatchQueue.main.async {
                collection.reloadData()
            }
        }
        let search = UISearchController()
        search.searchBar.searchTextField.delegate = self
        navigationItem.searchController = search
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCell.reuseID, for: indexPath) as! ItemCell
        guard let url = items?[indexPath.item].urls.small else {return UICollectionViewCell()}
        cell.setImage(imageUrl: url)
        return cell
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.network.searchPhotoInQuery(query: textField.text!)
        return true
    }
}


