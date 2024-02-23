//
//  ViewController.swift
//  Hotel
//
//  Created by Amina TomasMart on 07.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var builder = {
        return ViewBuilder(controller: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(hex: "#141414FF")
        builder.setPageTitle(title: "Design your virtual card")
        builder.getCard()
        builder.getColorSlider()
        builder.setIconSlider()
        builder.setDescritionText()
        builder.addContinueBtn()
    }
    
    
}

