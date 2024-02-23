//
//  ViewController.swift
//  HomeWork_11
//
//  Created by Amina TomasMart on 13.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var myView1: UIView = {
        $0.frame = CGRect(x: 0, y: 0, width: view.frame.width/2, height: view.frame.height)
        $0.backgroundColor = .systemMint
        $0.addSubview(label1)
        $0.addSubview(label2)
        $0.addSubview(label3)
        
        return $0
    }(UIView())
    
    lazy var label1: UILabel = {
        $0.frame = CGRect(x: 30, y: 120, width: view.frame.width/3, height: 30)
        $0.backgroundColor = .white
        return $0
    }(UILabel())
    
    lazy var label2: UILabel = {
        $0.frame = CGRect(x: 30, y: 170, width: view.frame.width/3, height: 30)
        $0.backgroundColor = .white
        return $0
    }(UILabel())
    
    lazy var label3: UILabel = {
        $0.frame = CGRect(x: 30, y: 220, width: view.frame.width/3, height: 30)
        $0.backgroundColor = .white
        return $0
    }(UILabel())
    
    lazy var myView2: UIView = {
        $0.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        $0.backgroundColor = .systemOrange
        $0.addSubview(image1)
        $0.addSubview(image2)
        let swipe1 = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction1))
        let swipe2 = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction2))
        $0.addGestureRecognizer(swipe1)
        $0.addGestureRecognizer(swipe2)
        return $0
    }(UIView())
    
    lazy var image1: UIView = {
        $0.frame = CGRect(x: 25, y: 300, width: 150, height: 100)
        $0.backgroundColor = .white
        
        return $0
    }(UIView())
    
    lazy var image2: UIView = {
        $0.frame = CGRect(x: 25, y: 450, width: 150, height: 100)
        $0.backgroundColor = .white
        
        return $0
    }(UIView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(myView1)
        view.addSubview(myView2)
    }
    
    
    
    @objc func swipeAction1(sender: UISwipeGestureRecognizer) {
        
        UIView.animate(withDuration: 2) {
            sender.direction = .right
            self.myView2.frame = CGRect(x: self.view.frame.width/2, y: 0, width: self.view.frame.width/2, height: self.view.frame.height)
        }
    }
    
    @objc func swipeAction2(sender: UISwipeGestureRecognizer) {
        
        UIView.animate(withDuration: 2) {
            sender.direction = .left
            self.myView2.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        }
    }
}
