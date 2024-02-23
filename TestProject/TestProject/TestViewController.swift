//
//  TestViewController.swift
//  TestProject
//
//  Created by Amina TomasMart on 27.01.2024.
//

import UIKit

class TestViewController: UIViewController {
    
    var button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        displayingLayout()
    }
    
    func displayingLayout() {
        configButton()
        addToView()
        addConstraints()
    }
    
    func configButton() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 15
        button.setTitle("Скрыть", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    }
    
    @objc func tapButton() {
        dismiss(animated: true)
    }
    
    func addToView() {
        view.addSubview(button)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
}
