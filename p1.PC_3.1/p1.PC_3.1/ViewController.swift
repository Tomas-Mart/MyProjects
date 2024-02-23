//
//  ViewController.swift
//  p1.PC_3.1
//
//  Created by Amina TomasMart on 13.02.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    var myView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))

    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleTapGesture))
        view.addGestureRecognizer(tapRecognizer)
        
        view.addSubview(myView)
        view.addSubview(button)
    }
    
    @objc func animate() {
        let animator = UIViewPropertyAnimator(duration: 1, curve: .linear) {
            self.myView.frame = self.myView.frame.offsetBy(dx: 100, dy: 0)
        }
        animator.startAnimation(afterDelay: 1)
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        let vc = ModalViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @objc func handleTapGesture(sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
}

