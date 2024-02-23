//
//  ViewController.swift
//  3
//
//  Created by Amina TomasMart on 04.02.2024.
//

import UIKit

protocol MainDelegate {
    func setText(text: String)
}

class FirstViewController: UIViewController {
    
    private let viewManager = ViewManager()
    
    lazy var action =  UIAction { _ in
        let vc = SecondViewController()
        vc.delegate = self
        self.setText(text: "Text from 1")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Main"
        view.backgroundColor = .white
        let btn = viewManager.getBtn(action: action)
        btn.center = view.center
        view.addSubview(btn)
        setView()
    }
    
    private func setView() {
        lazy var contentView: UIView = {
            let myView = UIView()
            myView.translatesAutoresizingMaskIntoConstraints = false
            myView.backgroundColor = .gray
            
            return myView
        }()
        
        view.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            contentView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func setText(text: String) {
        print(text)
    }
}
extension FirstViewController: MainDelegate {
    
}
