//
//  ThirdViewController.swift
//  p5m2_9
//
//  Created by Amina TomasMart on 09.02.2024.
//

import UIKit

class ThirdViewController: UIViewController {
    
    let service = Service.shared
    
    lazy var label: UILabel = {
        $0.frame = CGRect(x: view.center.x-50, y: view.center.y, width: 100, height: 50)
        $0.backgroundColor = .white
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    lazy var btn: UIButton = {
        $0.frame = CGRect(x: view.center.x-50, y: view.center.y+100, width: 100, height: 50)
        $0.backgroundColor = .blue
        $0.setTitle("ЖМИ", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        return $0
    }(UIButton(primaryAction: action))
    
    lazy var action = UIAction {_ in
        let userInfo = ["name": "IOS2"]
        NotificationCenter.default.post(name: .fm, object: nil, userInfo: userInfo)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        navigationItem.title = "Test3"
        view.addSubview(label)
        view.addSubview(btn)
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
