//
//  SecondViewController.swift
//  p5m3_1
//
//  Created by Amina TomasMart on 16.02.2024.
//

import UIKit

class SecondViewController: UIViewController {
    
    let service = Service.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        print(service.token)
    }
    
    @IBAction func btnAction(_ sender: Any) {
        let userInfo = ["name": "IOS"]
        NotificationCenter.default.post(name: .fm, object: nil, userInfo: userInfo)
    }
}

extension NSNotification.Name {
    static let fm = Notification.Name("101FM")
}
