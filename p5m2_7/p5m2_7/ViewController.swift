//
//  ViewController.swift
//  p5m2_7
//
//  Created by Amina TomasMart on 07.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    let sliderLColors = [#colorLiteral(red: 0.09498735517, green: 0.6289128661, blue: 0.5205506682, alpha: 1), #colorLiteral(red: 0.2051374316, green: 0.5963311195, blue: 0.8612344861, alpha: 1), #colorLiteral(red: 0.5545662045, green: 0.2667133212, blue: 0.6761468053, alpha: 1)]
    let sliderImages = ["1", "2", "3"]
    let sliderLabels = [
        "Lorem ipsum dolor sit amet, consectetur adipisicing",
        "Duis aute irure dolor in reprehenderit in voluptate velit esse",
        "Sunt in culpa qui officia"
    ]
    
    private lazy var label: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Error Nil"
        $0.numberOfLines = 0
        $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        $0.textColor = .white
        return $0
    }(UILabel())
    
    private lazy var signInButton: UIButton = {
        .config($0) {
            $0.backgroundColor = .white
            $0.setTitle("Войти", for: .normal)
            $0.setTitleColor(.black, for: .normal)
        }
    }(UIButton(primaryAction: action))
    
    private lazy var registrInButton: UIButton = {
        .config($0) {            $0.setTitle("Регистрация", for: .normal)
            $0.setTitleColor(.white, for: .normal)
        }
    }(UIButton(primaryAction: action))
    
    private lazy var action = UIAction { _ in
        print("1")
    }
    
    lazy var collection = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.dataSource = self
        collection.delegate = self
        collection.frame = view.bounds
        collection.isPagingEnabled = true
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collection)
    }
    
    private func getLabelForSlider(item: Int) -> UILabel {
        let text = UILabel()
        text.text = sliderLabels[item]
        text.numberOfLines = 0
        text.textAlignment = .left
        text.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        text.textColor = .white
        
        return text
    }
    
    private func getImageForSlider(item: Int) -> UIImageView {
        let image = UIImageView()
        image.image = UIImage(named: sliderImages[item])
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }
    
    private func getColorForSlider(item: Int) -> UIColor {
        var color = UIColor()
        color = sliderLColors[item]
        return color
    }
}

extension UIButton {
    
    static func config<T: UIButton>(_ button: T, _ block: (T) -> ()) -> T {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 30
        button.clipsToBounds = true
      
        block(button)
        return button
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sliderImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = getColorForSlider(item: indexPath.item)
        let text = getLabelForSlider(item: indexPath.item)
        text.translatesAutoresizingMaskIntoConstraints = false
        let image = getImageForSlider(item: indexPath.item)
        image.translatesAutoresizingMaskIntoConstraints = false
        cell.addSubview(text)
        cell.addSubview(image)
        if indexPath.item == sliderImages.count-1 {
            cell.addSubview(signInButton)
            cell.addSubview(registrInButton)
            signInButton.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 20).isActive = true
            signInButton.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -20).isActive = true
            signInButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
            
            registrInButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20).isActive = true
            registrInButton.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 20).isActive = true
            registrInButton.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -20).isActive = true
            registrInButton.bottomAnchor.constraint(equalTo: cell.bottomAnchor, constant: -50).isActive = true
        }
        if indexPath.item == sliderImages.count-sliderImages.count {
            cell.addSubview(label)
            label.topAnchor.constraint(equalTo: cell.topAnchor, constant: 50).isActive = true
            label.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 20).isActive = true
        }
        
        NSLayoutConstraint.activate([
            
            text.topAnchor.constraint(equalTo: cell.topAnchor, constant: 130),
            text.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 20),
            text.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -20),
            
            image.centerXAnchor.constraint(equalTo: cell.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: cell.centerYAnchor),
            image.widthAnchor.constraint(equalToConstant: 293),
            image.heightAnchor.constraint(equalToConstant: 293),
            
        ])
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        view.bounds.size
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    }
    
    //    func  collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    //        UIEdgeInsets(top: 10, left: 40, bottom: 10, right: 110)
    //    }
}
