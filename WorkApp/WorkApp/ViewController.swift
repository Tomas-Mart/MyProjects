//
//  ViewController.swift
//  WorkApp
//
//  Created by Amina TomasMart on 21.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var constraint: NSLayoutConstraint!
    @IBOutlet weak var constraint2: NSLayoutConstraint!
    let screen = UIScreen.main.bounds
    var isAnimated = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton()
        view.addSubview(button)
        button.addTarget(self, action: #selector(buttonPress2), for: .touchUpInside)
        button.backgroundColor = .systemBlue
        button.setTitle("Click", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: screen.height/10).isActive = true
    }
    @IBAction func buttonPress(_ sender: Any) {
        if !isAnimated {
            UIView.animate(withDuration: 1, delay: 0.1, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.2, animations: {
                self.constraint.constant = 100
                self.view.layoutIfNeeded()
            })
            isAnimated = true
        } else {
            UIView.animate(withDuration: 1, delay: 0.1, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.2, animations: {
                self.constraint.constant = 16
                self.view.layoutIfNeeded()
            })
            isAnimated = false
        }
    }
    @objc func buttonPress2(_ sender: Any) {
        if !isAnimated {
            UIView.animate(withDuration: 1, delay: 0.1, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.2, animations: {
                self.constraint2.constant = 100
                self.view.layoutIfNeeded()
            })
            isAnimated = true
        } else {
            UIView.animate(withDuration: 1, delay: 0.1, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.2, animations: {
                self.constraint2.constant = 16
                self.view.layoutIfNeeded()
            })
            isAnimated = false
        }
    }
}
