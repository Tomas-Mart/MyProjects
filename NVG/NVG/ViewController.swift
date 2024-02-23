//
//  ViewController.swift
//  NVG
//
//  Created by Amina TomasMart on 22.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemPink
        let button = UIButton(frame: CGRect(x: 150, y: 300, width: 100, height: 30))
        button.setTitle("Go", for: .normal)
        button.setTitleColor(.systemPink, for: .normal)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(showFirst), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc func showFirst() {
        let firstVC = FirstVC()
        navigationController?.pushViewController(firstVC, animated: true)
    }
}
