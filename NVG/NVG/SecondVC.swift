//
//  NavigationViewController.swift
//  NVG
//
//  Created by Amina TomasMart on 22.01.2024.
//

import UIKit

class SecondVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemIndigo
        let button = UIButton(frame: CGRect(x: 150, y: 300, width: 100, height: 30))
        button.setTitle("Go", for: .normal)
        button.setTitleColor(.systemIndigo, for: .normal)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(dismissSecond), for: .touchUpInside)
        view.addSubview(button)
    }
    @objc func dismissSecond() {
        let second = SecondVC()
        second.dismiss(animated: true)
    }
}
