//
//  HotelVC.swift
//  TestHotel
//
//  Created by Amina TomasMart on 23.12.2023.
//

import UIKit

class HotelVC: UIViewController {
    
    var gallery = Gallery()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(gallery)
        gallery.topAnchor.constraint(equalTo: view.topAnchor, constant: 101).isActive = true
        gallery.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        gallery.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        gallery.heightAnchor.constraint(equalToConstant: 257).isActive = true
    }
}
class Gallery: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var cells = ["1", "2", "3"]
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super .init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = .white
        delegate = self
        dataSource = self
        register(Cell.self, forCellWithReuseIdentifier: Cell.reuseID)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: Cell.reuseID, for: indexPath) as! Cell
        cell.image.image = UIImage(named: cells[indexPath.item])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 385, height: 257)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class Cell: UICollectionViewCell {
    
    static let reuseID = "Cell"
    
    let image: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let page: UIPageControl = {
        let rect = CGRect(origin: CGPoint(x: 140, y: 235), size: CGSize(width: 115, height: 15))
        let pc = UIPageControl(frame: rect)
        pc.currentPage = 0
        pc.numberOfPages = 3
        pc.layer.cornerRadius = 5
        pc.backgroundColor = .white
        pc.pageIndicatorTintColor = .gray
        pc.currentPageIndicatorTintColor = .black
        pc.isUserInteractionEnabled = false
        return pc
    }()
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        addSubview(image)
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        image.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        image.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        image.topAnchor.constraint(equalTo: topAnchor).isActive = true
        image.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        addSubview(page)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        page.currentPage = indexPath.item
    }
}
