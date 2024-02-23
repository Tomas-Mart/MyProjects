//
//  DetailsViewController.swift
//  p5m2_6
//
//  Created by Amina TomasMart on 05.02.2024.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var data: TableData?
    
    private lazy var nameText: UILabel = {
        .config($0) {
            $0.text = data?.name
            $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        }
    }(UILabel())
    
    private lazy var image: UIImageView = {
        .config($0) {
            $0.layer.cornerRadius = 15
            $0.clipsToBounds = true
        }
    }(UIImageView())
    
    private lazy var text: UILabel = {
        .config($0) {
            $0.text = data?.text
            $0.numberOfLines = 0
        }
    }(UILabel())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = UIImage(named: data!.photo)
        view.backgroundColor = .white
        view.addSubview(nameText)
        view.addSubview(image)
        view.addSubview(text)
        addConstraints()
    }
    
    func addConstraints() {
        let ratio = (image.image?.size.height ?? 0) / (image.image?.size.width ?? 0)
        let imageH = (view.frame.width-20) * ratio
        
        NSLayoutConstraint.activate([
            
            nameText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            nameText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            nameText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            image.topAnchor.constraint(equalTo: nameText.bottomAnchor, constant: 20),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            image.heightAnchor.constraint(equalToConstant: imageH),
            
            text.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 60),
            text.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            text.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            
        ])
    }
}
