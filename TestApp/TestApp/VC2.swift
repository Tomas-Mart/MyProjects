//
//  VC2.swift
//  TestApp
//
//  Created by Amina TomasMart on 20.01.2024.
//

import UIKit

class VC2: UIViewController {

    @IBOutlet weak var GoToVC2Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        GoToVC2Button.tintColor = .red
        
        let viewRed = UIView(frame: CGRect(x: 50, y: 50, width: 50, height: 50))
        viewRed.backgroundColor = .red
        
        let button = UIButton(frame: CGRect(x: 50, y: 50, width: 25, height: 25))
        button.backgroundColor = .white
        
        view.addSubview(viewRed)
        view.addSubview(button)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
    }
    
    deinit {
        print("Free")
    }
    
    @IBAction func showVC1(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
