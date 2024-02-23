//
//  ViewController.swift
//  VohidovaFatima_HW3_1
//
//  Created by Amina TomasMart on 09.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var viewUsa: UIView = {
        let sizeW = view.frame.width-40
        let sizeH = view.frame.height/3-60
        let centerX = view.center.x-sizeW/2
        $0.frame = CGRect(x: centerX, y: view.frame.height-sizeH*3-70, width: sizeW, height: sizeH)
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapForItem(sender:)))
        $0.addGestureRecognizer(tap)
        tap.numberOfTapsRequired = 1
        $0.addSubview(flagUSA)
        $0.tag = 1
        return $0
    }(UIView())
    
    lazy var viewBrt: UIView = {
        let sizeW = view.frame.width-40
        let sizeH = view.frame.height/3-60
        let centerX = view.center.x-sizeW/2
        $0.frame = CGRect(x: centerX, y: view.frame.height-sizeH*2-50, width: sizeW, height: sizeH)
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapForItem(sender:)))
        $0.addGestureRecognizer(tap)
        tap.numberOfTapsRequired = 1
        $0.addSubview(flagBRT)
        $0.tag = 2
        return $0
    }(UIView())
    
    lazy var viewFrg: UIView = {
        let sizeW = view.frame.width-40
        let sizeH = view.frame.height/3-60
        let centerX = view.center.x-sizeW/2
        $0.frame = CGRect(x: centerX, y: view.frame.height-sizeH-30, width: sizeW, height: sizeH)
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapForItem(sender:)))
        $0.addGestureRecognizer(tap)
        tap.numberOfTapsRequired = 1
        $0.addSubview(flagFRG)
        $0.tag = 3
        return $0
    }(UIView())
    
    lazy var label: UILabel = {
        let sizeW = view.frame.width-40
        let sizeH = view.frame.height/3-60
        let centerX = view.center.x-sizeW/2
        $0.frame = CGRect(x: centerX, y: view.frame.height-sizeH*3-130, width: sizeW-60, height: 50)
        $0.text = "Выберите страну для VPN"
        $0.textAlignment = .right
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return $0
    }(UILabel())
    
    lazy var button: UIButton = {
        let sizeW = view.frame.width-40
        let sizeH = view.frame.height/3-60
        let centerX = view.center.x-sizeW/2
        $0.frame = CGRect(x: sizeW-30, y: view.frame.height-sizeH*3-130, width: 50, height: 50)
        $0.setImage(UIImage(named: "1"), for: .normal)
        $0.alpha = 0
        return $0
    }(UIButton())
    
    lazy var flagUSA: UIImageView = {
        $0.image = .USA
        let sizeW = view.frame.width-40
        let sizeH = view.frame.height/3-60
        let centerX = view.center.x-sizeW/2
        $0.frame = CGRect(x: .zero, y: .zero, width: sizeW, height: sizeH)
        return $0
    }(UIImageView())
    
    lazy var flagBRT: UIImageView = {
        $0.image = .BRT
        let sizeW = view.frame.width-40
        let sizeH = view.frame.height/3-60
        let centerX = view.center.x-sizeW/2
        $0.frame = CGRect(x: .zero, y: .zero, width: sizeW, height: sizeH)
        return $0
    }(UIImageView())
    
    lazy var flagFRG: UIImageView = {
        $0.image = .FRG
        let sizeW = view.frame.width-40
        let sizeH = view.frame.height/3-60
        let centerX = view.center.x-sizeW/2
        $0.frame = CGRect(x: .zero, y: .zero, width: sizeW, height: sizeH)
        return $0
    }(UIImageView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.3468093872, green: 0.3369394839, blue: 0.8329761624, alpha: 1)
        view.addSubview(label)
        view.addSubview(button)
        view.addSubview(viewFrg)
        view.addSubview(viewBrt)
        view.addSubview(viewUsa)
    }
    
    @objc func tapForItem(sender: UITapGestureRecognizer) {
        let sizeW = view.frame.width-40
        let sizeH = view.frame.height/3-60
        let centerX = view.center.x-sizeW/2
        guard let image = sender.view else {return}
        
        UIView.animate(withDuration: 3, delay: 0.0, options: .curveEaseOut) {
            image.frame = CGRect(x: centerX, y: self.view.frame.height-sizeH-30, width: sizeW, height: sizeH)
            self.view.backgroundColor = .white
            self.button.alpha = 1
            self.label.alpha = 0
            
            switch sender.view {
                
            case self.viewUsa:
                self.flagBRT.alpha = 0
                self.flagFRG.alpha = 0
                
            case self.viewBrt:
                self.flagUSA.alpha = 0
                self.flagFRG.alpha = 0
                
            case self.viewFrg:
                self.flagBRT.alpha = 0
                self.flagUSA.alpha = 0
                
            default:
                break
            }
        }
    }
}
