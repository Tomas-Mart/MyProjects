//
//  FirstVC.swift
//  NVG
//
//  Created by Amina TomasMart on 23.01.2024.
//

import UIKit

class FirstVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemPurple
        let button = UIButton(frame: CGRect(x: 150, y: 300, width: 100, height: 30))
        button.setTitle("Go", for: .normal)
        button.setTitleColor(.systemPurple, for: .normal)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(showSecond), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc func showSecond() {
        let secondVC = SecondVC()
        navigationController?.pushViewController(secondVC, animated: true)
    }
}
