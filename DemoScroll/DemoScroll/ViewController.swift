//
//  ViewController.swift
//  DemoScroll
//
//  Created by Amina TomasMart on 23.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var scroll = UIScrollView()
    var content = UIView()
    var lable = UILabel()
    var test = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    func setupLayout() {
        configScroll()
        configContent()
        configLabel()
        configTest()
        addObjectsToView()
    }
    
    func configScroll() {
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.showsVerticalScrollIndicator = true
        scroll.alwaysBounceVertical = true
    }
    
    func configContent() {
        content.translatesAutoresizingMaskIntoConstraints = false
        content.backgroundColor = .systemPink
    }
    
    func configLabel() {
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "This is Scroll View Label"
        lable.textColor = .white
    }
    
    func configTest() {
        test.translatesAutoresizingMaskIntoConstraints = false
        test.backgroundColor = .systemIndigo
    }
    
    func addObjectsToView() {
        view.addSubview(scroll)
        scroll.addSubview(content)
        content.addSubview(lable)
        content.addSubview(test)
        
        NSLayoutConstraint.activate([
            scroll.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scroll.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scroll.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scroll.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            content.topAnchor.constraint(equalTo: scroll.topAnchor),
            content.leadingAnchor.constraint(equalTo: scroll.leadingAnchor),
            content.trailingAnchor.constraint(equalTo: scroll.trailingAnchor),
            content.bottomAnchor.constraint(equalTo: scroll.bottomAnchor),
            content.widthAnchor.constraint(equalTo: scroll.widthAnchor),
            
            lable.topAnchor.constraint(equalTo: content.topAnchor, constant: 100),
            lable.centerXAnchor.constraint(equalTo: content.centerXAnchor),
            
            test.topAnchor.constraint(equalTo: lable.bottomAnchor, constant: 100),
            test.leadingAnchor.constraint(equalTo: content.leadingAnchor),
            test.trailingAnchor.constraint(equalTo: content.trailingAnchor),
            test.heightAnchor.constraint(equalToConstant: 2000),
            test.bottomAnchor.constraint(equalTo: content.bottomAnchor)
        ])
    }
}



