//
//  ViewController.swift
//  p5m2_11
//
//  Created by Amina TomasMart on 13.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var segment: UISegmentedControl = {
        $0.insertSegment(withTitle: "Main", at: 0, animated: true)
        $0.insertSegment(withTitle: "Photo", at: 1, animated: true)
        $0.insertSegment(withTitle: "Camera", at: 2, animated: true)
        $0.insertSegment(with: UIImage(systemName: "camera"), at: 3, animated: true)

        $0.frame = CGRect(x: 10, y: 50, width: view.frame.width-20, height: 50)
        $0.backgroundColor = .systemPink
        $0.selectedSegmentIndex = 3
        $0.selectedSegmentTintColor = .systemGray
        $0.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.systemPink], for: .selected)
        $0.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        $0.addAction(action, for: .valueChanged)

        return $0
    }(UISegmentedControl())
    
    lazy var action = UIAction { sender in
        guard let segment = sender.sender as? UISegmentedControl else {return}
        print(segment.selectedSegmentIndex)
    }
    
    lazy var slider: UISlider = {
        $0.frame = CGRect(x: view.center.x-100, y: view.center.y-300, width: 200, height: 30)
        $0.minimumValue = 0
        $0.maximumValue = 10
        $0.value = 5
        $0.minimumTrackTintColor = .red
        $0.maximumTrackTintColor = .green
        $0.thumbTintColor = .blue
        $0.addTarget(self, action: #selector(sliderAction(sender:)), for: .valueChanged)
        
       return $0
    }(UISlider())
    
    lazy var mySwitch: UISwitch = {
        $0.frame.origin = CGPoint(x: view.center.x, y: view.center.y-200)
        $0.addAction(action2, for: .valueChanged)
        return $0
    }(UISwitch())
    
    lazy var action2 = UIAction { sender in
        guard let sender = sender.sender as? UISwitch else {return}
        print(sender.isOn)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(segment)
        view.addSubview(slider)
        view.addSubview(mySwitch)
    }
    
    @objc func sliderAction(sender: UISlider) {
        let step: Float = 10
        let roundedValue = round(sender.value/step)*step
        sender.value = roundedValue
    }


}

