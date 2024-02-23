//
//  SecondViewController.swift
//  p5m2_11
//
//  Created by Amina TomasMart on 13.02.2024.
//

import UIKit

class SecondViewController: UIViewController {
    
    var bottomCnstr: NSLayoutConstraint?
    
    lazy var slideView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .gray
        return $0
    }(UIView())
    
    lazy var slideView2: UIView = {
        $0.frame = CGRect(x: 20, y: 100, width: 50, height: 50)
        $0.backgroundColor = .gray
        return $0
    }(UIView())
    
    lazy var mySwitch: UISwitch = {
        $0.frame.origin = CGPoint(x: 20, y: 50)
        $0.addAction(actionSwitch, for: .valueChanged)
        return $0
    }(UISwitch())
    
    lazy var actionSwitch = UIAction { sender in
        guard let sender = sender.sender as? UISwitch else {return}
        if sender.isOn {
            self.bottomCnstr?.constant = 0
        } else {
            self.bottomCnstr?.constant = 100
        }
        UIView.animate(springDuration: 0.4, bounce: 0.4, animations: {
            if sender.isOn {
                self.slideView2.frame.origin.x = 300
                self.slideView2.backgroundColor = .systemPink
            } else {
                self.slideView2.frame.origin.x = 20
                self.slideView2.backgroundColor = .gray
            }
            self.view.layoutIfNeeded()
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mySwitch)
        view.addSubview(slideView)
        view.addSubview(slideView2)
        bottomCnstr = slideView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 100)
        bottomCnstr?.isActive = true
        
        NSLayoutConstraint.activate([
            
            slideView.heightAnchor.constraint(equalToConstant: 100),
            slideView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            slideView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            slideView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 100)
        ])
    }
}
