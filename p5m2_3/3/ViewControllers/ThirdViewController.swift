//
//  ThirdViewController.swift
//  3
//
//  Created by Amina TomasMart on 04.02.2024.
//

import UIKit

class ThirdViewController: UIViewController {
    
    private let viewManager = ViewManager()
    var delegate: MainDelegate?
    lazy var action =  UIAction { _ in
        self.delegate?.setText(text: "Text from 3")
        let vc = FourthViewController()
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Third"
        view.backgroundColor = .white
        let btn = viewManager.getBtn(action: action)
        btn.center = view.center
        view.addSubview(btn)
    }
    func setText(text: String) {
        print("Text from 3")
        delegate?.setText(text: text)
    }
}
extension ThirdViewController: MainDelegate {
    
}
