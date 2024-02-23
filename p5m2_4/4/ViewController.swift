//
//  ViewController.swift
//  4
//
//  Created by Amina TomasMart on 04.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var scroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.alwaysBounceVertical = true
        scroll.addSubview(content)
        scroll.backgroundColor = .white
        return scroll
    }()
    
    lazy var content: UIView = {
        let content = UIView()
        content.translatesAutoresizingMaskIntoConstraints = false
        content.backgroundColor = .systemGray6
        return content
    }()
    
    lazy var myTitle: UILabel = {
        let myTitle = UILabel()
        myTitle.translatesAutoresizingMaskIntoConstraints = false
        myTitle.text = "Text.ru – это популярный портал для проверки текстов и крупнейшая биржа текстового контента. Ежедневно на Сервисе проверяются и создаются разные форматы: описания карточек товара, статьи и письменные работы. Мы создали прозрачную и надежную систему сотрудничества между заказчиками и исполнителями, чтобы каждому было комфортно работать и находиться на Сайте."
        myTitle.font = UIFont.systemFont(ofSize: 20, weight: .black)
        myTitle.textColor = .black
        myTitle.numberOfLines = 0
        myTitle.textAlignment = .center
        return myTitle
    }()
    
    let images = [
        UIImage(named: "1")!,
        UIImage(named: "2")!,
        UIImage(named: "1")!,
        UIImage(named: "2")!,
        UIImage(named: "1")!,
        UIImage(named: "2")!,
        UIImage(named: "1")!,
        UIImage(named: "2")!,
        UIImage(named: "1")!,
        UIImage(named: "2")!,
        UIImage(named: "1")!,
        UIImage(named: "2")!
    ]
    
    lazy var vStack: UIStackView = {
        let vStack = UIStackView()
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.axis = .vertical
        vStack.spacing = 20
        images.forEach {
            let image = self.getImage(image: $0)
            vStack.addArrangedSubview(image)
        }
        return vStack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(scroll)
        content.addSubview(myTitle)
        content.addSubview(vStack)
        
        NSLayoutConstraint.activate([
            
            scroll.topAnchor.constraint(equalTo: view.topAnchor),
            scroll.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scroll.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scroll.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            content.topAnchor.constraint(equalTo: scroll.topAnchor),
            content.leadingAnchor.constraint(equalTo: scroll.leadingAnchor),
            content.trailingAnchor.constraint(equalTo: scroll.trailingAnchor),
            content.bottomAnchor.constraint(equalTo: scroll.bottomAnchor),
            content.widthAnchor.constraint(equalTo: scroll.widthAnchor),
            
            myTitle.topAnchor.constraint(equalTo: content.topAnchor, constant: 20),
            myTitle.leadingAnchor.constraint(equalTo: content.leadingAnchor, constant: 20),
            myTitle.trailingAnchor.constraint(equalTo: content.trailingAnchor, constant: -20),
            
            vStack.topAnchor.constraint(equalTo: myTitle.bottomAnchor, constant: 20),
            vStack.leadingAnchor.constraint(equalTo: content.leadingAnchor, constant: 20),
            vStack.trailingAnchor.constraint(equalTo: content.trailingAnchor, constant: -20),
            vStack.bottomAnchor.constraint(equalTo: content.bottomAnchor, constant: -20),
        ])
    }
    private func getImage(image: UIImage) -> UIImageView {
        let myImage = UIImageView()
        myImage.translatesAutoresizingMaskIntoConstraints = false
        myImage.image = image
        let ratio = image.size.height/image.size.width
        let imgH = (view.frame.width-40)*ratio
        myImage.heightAnchor.constraint(equalToConstant: imgH).isActive = true
        myImage.contentMode = .scaleAspectFill
        myImage.layer.cornerRadius = 15
        myImage.clipsToBounds = true
        return myImage
    }
    
}

