//
//  ViewController.swift
//  TestApp
//
//  Created by Amina TomasMart on 20.01.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    @IBAction func showVC2(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc2 = storyboard.instantiateViewController(identifier: "VC2")
        self.present(vc2, animated: true)
    }
    

}

