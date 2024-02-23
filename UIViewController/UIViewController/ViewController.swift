//
//  ViewController.swift
//  UIViewController
//
//  Created by Amina TomasMart on 20.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Вызван viewDidLoad")
        label.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("Вызван viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("Вызван viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print("Вызван viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        print("Вызван viewDidDisappear")
    }
    
    deinit {
        print("Вызван deinit")
    }
    @IBAction func buttonAction(_ sender: UIButton) {
        print("Кнопка нажата")
        
        if label.isHidden {
            label.isHidden = false
            label.text = "Hello"
            button.setTitle("Clear", for: .normal)
            button.setTitleColor(.green, for: .normal)
            button.backgroundColor = .yellow
        } else {
            label.isHidden = true
            button.setTitle("Hello", for: .normal)
            button.setTitleColor(.yellow, for: .normal)
            button.backgroundColor = .green
        }
    }
}
