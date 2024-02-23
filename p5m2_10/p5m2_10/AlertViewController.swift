//
//  ViewController.swift
//  p5m2_10
//
//  Created by Amina TomasMart on 12.02.2024.
//

import UIKit

class AlertViewController: UIViewController {
    
    lazy var btn: UIButton = {
        $0.center = view.center
        $0.frame.size = CGSize(width: 100, height: 50)
        $0.setTitle("alert", for: .normal)
        return $0
    }(UIButton(primaryAction: action))
    
    lazy var action = UIAction { _ in
        self.present(self.alert, animated: true)
    }
    
    lazy var alert: UIAlertController = {
        let alert = UIAlertController(title: "Alert title", message: "Alert MSG", preferredStyle: .alert)
        
        alert.addTextField {
            $0.placeholder = "Number"
            $0.keyboardType = .namePhonePad
            $0.textColor = .black
            $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        }
        
        alert.addTextField {
            $0.placeholder = "Email"
            $0.keyboardType = .emailAddress
            $0.textColor = .black
            $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        }
        
        alert.addTextField {
            $0.placeholder = "Password"
            $0.isSecureTextEntry = true
            $0.textColor = .black
            $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        }

        let okBtn = UIAlertAction(title: "Ok", style: .default) { _ in
            print(alert.textFields?[0].text ?? "")
            
        }
        
        let destructiveBtn = UIAlertAction(title: "Destructive", style: .destructive) { _ in
            print("destructive")
        }
        
        let cancelBtn = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("cancel")
        }
        
        alert.addAction(okBtn)
        alert.addAction(cancelBtn)
        alert.addAction(destructiveBtn)
        
        return alert
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(btn)
    }
    
    
}

