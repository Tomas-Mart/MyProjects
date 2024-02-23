//
//  ModalVC.swift
//  p1.PC_3.1
//
//  Created by Amina TomasMart on 13.02.2024.
//

import UIKit

class ModalVC: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let animation = CABasicAnimation(keyPath: "backgroundColor")
        animation.fromValue = UIColor.white.cgColor
        animation.toValue = UIColor.systemMint.cgColor
        animation.duration = 1
        animation.repeatCount = 5
        animation.autoreverses = true
        view.layer.add(animation, forKey: "backgroundColor")
        
        let animation2 = CABasicAnimation(keyPath: "transform.scale")
        animation2.fromValue = CGPoint(x: 1, y: 1)
        animation2.toValue = CGPoint(x: 0.5, y: 0.5)
        animation2.duration = 1
        animation2.repeatCount = 5
        animation2.autoreverses = true
        view.layer.add(animation2, forKey: "transform.scale")
    }
}
