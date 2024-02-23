//
//  ViewController.swift
//  p5m3_1
//
//  Created by Amina TomasMart on 16.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textF: UITextField!
    @IBOutlet weak var label: UILabel!
    let service = Service.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        service.token = "Test"
        NotificationCenter.default.addObserver(self, selector: #selector(setTitle(sender:)), name: .fm, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardShow(sender:)), name: UIResponder.keyboardDidChangeFrameNotification, object: nil)
    }
    
    @objc func keyBoardShow(sender: Notification) {
        guard let kFrame = sender.userInfo?["UIKeyboardBoundsUserInfoKey"] as? NSValue else {return}
    }

    @objc func setTitle(sender: Notification) {
        guard let data = sender.userInfo as? [String: String] else {return}
        label.text = data["name"]

    }
    
    @IBAction func sendNT(_ sender: Any) {
        let userInfo = ["name": "IOS2"]
        NotificationCenter.default.post(name: .fm, object: nil, userInfo: userInfo)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

