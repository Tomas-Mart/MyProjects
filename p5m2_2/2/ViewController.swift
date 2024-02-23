//
//  ViewController.swift
//  2
//
//  Created by Amina TomasMart on 31.01.2024.
//

import UIKit

protocol ViewControllerDelegate {
    func setText(text: String)
}

class ViewController: UIViewController {
    
    let screen = UIScreen.main.bounds
    
    func setText(text: String) {
        resultLabel.text = text
    }
    
    lazy var titleLabel = {
        let label = UILabel(frame: CGRect(x: screen.width / 2 - 100, y: 200, width: 200, height: 50))
        label.text = "Результат"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var resultLabel = {
        let label = UILabel(frame: CGRect(x: screen.width / 2 - 175 , y: 250, width: 350, height: 50))
        label.font = UIFont.systemFont(ofSize: 45)
        label.textAlignment = .center
        label.textColor = .black
        let vc = SecondViewController()
        return label
    }()
    
    lazy var countButton = {
        let button = UIButton(frame: CGRect(x: screen.width / 2 - 175, y: 450, width: 350, height: 50), primaryAction: action)
        button.setTitle("рассчитать" , for: .normal)
        button.backgroundColor = .systemBlue
        
        return button
    }()
    
    lazy var action = UIAction { _ in
        let vc = SecondViewController()
        vc.delegate = self
        self.setText(text: "")
        self.navigationController?.pushViewController(vc, animated: true)
        vc.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Калькулятор"
        view.backgroundColor = .systemGray6
        view.addSubview(resultLabel)
        view.addSubview(titleLabel)
        view.addSubview(countButton)
    }
}
    extension ViewController: ViewControllerDelegate {
        
    }
