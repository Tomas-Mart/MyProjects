//
//  ModalViewController.swift
//  p1.PC_3.1
//
//  Created by Amina TomasMart on 13.02.2024.
//

import UIKit

class ModalViewController: UIViewController {
    
    let myView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        
        myView.backgroundColor = .systemPink
        myView.alpha = 0.5
        myView.center = view.center
        
        let button = UIButton(frame: CGRect(x: view.center.x-50, y: view.center.y+250, width: 100, height: 50))
        button.backgroundColor = .systemPink
        button.setTitle("Start", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(animate), for: .touchUpInside)
        
        let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipeGesture))
        swipeRecognizer.direction = .down
        
        view.addSubview(myView)
        view.addSubview(button)
        view.addGestureRecognizer(swipeRecognizer)
    }
    
    @objc func animate() {
        UIView.animate(withDuration: 3) {
            self.myView.alpha = 1
            self.myView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
            self.myView.backgroundColor = .systemPurple
            self.myView.center = self.view.center
        } completion: { flag in
            if flag {
                UIView.animate(withDuration: 3) {
                    self.myView.alpha = 0.5
                    self.myView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
                    self.myView.backgroundColor = .systemPink
                    self.myView.center = self.view.center
                    
                } completion: { flag in
                    if flag {
                        UIView.animate(withDuration: 10) {
                            let vc = ModalViewController2()
                            vc.modalPresentationStyle = .fullScreen
                            self.present(vc, animated: true)
                        }
                    }
                }
            }
        }
    }
    
    @objc func handleSwipeGesture(sender: UISwipeGestureRecognizer) {
        dismiss(animated: true)
    }
}
