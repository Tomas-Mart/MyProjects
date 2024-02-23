//
//  ModalViewController2.swift
//  p1.PC_3.1
//
//  Created by Amina TomasMart on 13.02.2024.
//

import UIKit

class ModalViewController2: UIViewController {
    
    let myView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        
        myView.backgroundColor = .systemPink
        myView.alpha = 1
        myView.center = view.center
        
        let button = UIButton(frame: CGRect(x: view.center.x-50, y: view.center.y+250, width: 100, height: 50))
        button.backgroundColor = .systemPink
        button.setTitle("Start", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(animate), for: .touchUpInside)
        
        view.addSubview(myView)
        view.addSubview(button)
    }
    
    @objc func animate() {
        UIView.animateKeyframes(withDuration: 10, delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5) {
                self.myView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
                self.myView.center = self.view.center
            }
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25) {
                self.myView.backgroundColor = .systemPurple
            }
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
                self.myView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
                self.myView.center = self.view.center
            }
        }
    }
}
