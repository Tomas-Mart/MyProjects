//
//  ViewController.swift
//  p5m3_4
//
//  Created by Amina TomasMart on 19.02.2024.
//

import UIKit
import KeychainSwift

class ViewController: UIViewController {
    
    let storage = StorageManager()
    
    lazy var img: UIImageView = {
        return $0
    }(UIImageView(frame: CGRect(x: view.center.x-100, y: view.center.y-100, width: 200, height: 200)))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(img)
        if let image = UIImage(data: storage.loadImage(fileName: "img.jpg")) {
            img.image = image
        }
    }
}

