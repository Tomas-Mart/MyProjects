//
//  FourthViewController.swift
//  3
//
//  Created by Amina TomasMart on 04.02.2024.
//

import UIKit

class FourthViewController: UIViewController {
    
    private let viewManager = ViewManager()
    var delegate: MainDelegate?
    lazy var action =  UIAction { _ in
        self.delegate?.setText(text: "Text from 4")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Fourth"
        view.backgroundColor = .white
        let btn = viewManager.getBtn(action: action)
        btn.center = view.center
        view.addSubview(btn)

    }

}
