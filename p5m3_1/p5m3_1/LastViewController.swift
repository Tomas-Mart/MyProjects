//
//  LastViewController.swift
//  p5m3_1
//
//  Created by Amina TomasMart on 16.02.2024.
//

import UIKit

class LastViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(setTitle(sender:)), name: .fm, object: nil)
    }
   
    @objc func setTitle(sender: Notification) {
        guard let data = sender.userInfo as? [String: String] else {return}
        label.text = data["name"]

    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
