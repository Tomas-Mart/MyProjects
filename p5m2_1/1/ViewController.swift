//
//  ViewController.swift
//  1
//
//  Created by Amina TomasMart on 31.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var label1 = getLabel(text: "Меня зовут:", frame: CGRect(x: 50, y: 100, width: 140, height: 40))
    
    lazy var label2 = getLabel(text: "Моя фамилия:", frame: CGRect(x: 50, y: 130, width: 140, height: 40))
    
    lazy var label3 = getLabel(text: "Моя группа:", frame: CGRect(x: 50, y: 160, width: 140, height: 40))
    
    lazy var label4 = getLabel(text: "", frame: CGRect(x: 210, y: 100, width: 140, height: 40))
    
    lazy var label5 = getLabel(text: "", frame: CGRect(x: 210, y: 130, width: 140, height: 40))
    
    lazy var label6 = getLabel(text: "", frame: CGRect(x: 210, y: 160, width: 140, height: 40))
    
    lazy var btn1 = getButton(action: showName, frame: CGRect(x: 50, y: 300, width: 140, height: 40), title: "мое имя", color: .systemGreen)
    
    lazy var btn2 = getButton(action: showLastName, frame: CGRect(x: 210, y: 300, width: 140, height: 40), title: "моя фамилия", color: .systemBlue)
    
    lazy var btn3 = getButton(action: showMyGroup, frame: CGRect(x: 50, y: 360, width: 300, height: 40), title: "моя группа на курсе", color: .black)
    
    private func getLabel(text: String, frame: CGRect) -> UILabel {
        let label = UILabel()
        label.text = text
        label.frame = frame
        return label
    }
    
    private func getButton(action: UIAction, frame: CGRect, title: String, color: UIColor) -> UIButton {
        let btn = UIButton(primaryAction: action)
        btn.frame = frame
        btn.backgroundColor = color
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(.white, for: .normal)
        return btn
    }
      
    lazy var showName = UIAction { _ in
        self.label4.text = "Ксения"
    }
    
    lazy var showLastName = UIAction { _ in
        self.label5.text = "Томас-Март"
    }
    
    lazy var showMyGroup = UIAction { _ in
        self.label6.text = "p5m2/1"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "ViewController и его жизненный цикл"
        
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(label3)
        
        view.addSubview(label4)
        view.addSubview(label5)
        view.addSubview(label6)

        view.addSubview(btn1)
        view.addSubview(btn2)
        view.addSubview(btn3)
    }
}

