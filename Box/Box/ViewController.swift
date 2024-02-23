//
//  ViewController.swift
//  Box
//
//  Created by Amina TomasMart on 30.12.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let myView = UIView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        myView.backgroundColor = UIColor.red
        myView.layer.cornerRadius = 10
        myView.layer.borderWidth = 10
        myView.layer.borderColor = UIColor.blue.cgColor

        let myView1 = UIView(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
        myView1.backgroundColor = UIColor.yellow
        myView1.layer.cornerRadius = 10

        let myView2 = UIView(frame: CGRect(x: 25, y: 25, width: 50, height: 50))
        myView2.backgroundColor = UIColor.green
        myView2.layer.cornerRadius = 10
        
        let myView3 = MyView(frame: CGRect(x: 100, y: 400, width: 200, height: 200))

        myView1.addSubview(myView2)
        myView.addSubview(myView1)
        view.addSubview(myView)
        view.addSubview(myView3)
    }
}
class MyView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        tintColorDidChange()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func tintColorDidChange() {
        self.backgroundColor = .gray
    }
}
