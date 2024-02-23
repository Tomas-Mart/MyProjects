//
//  ViewController.swift
//  p5m2_9
//
//  Created by Amina TomasMart on 08.02.2024.
//

import UIKit

class FirstViewController: UIViewController {
    
    let service = Service.shared
    var originPosition: CGRect?
    var originTransform: CGAffineTransform?
    
    lazy var myView: UIView = {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapForItem(sender:)))
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(tapForItem(sender:)))
        let pan = UIPanGestureRecognizer(target: self, action: #selector(panForItem(sender:)))
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(pinchForItem(sender:)))
        let rotate = UIRotationGestureRecognizer(target: self, action: #selector(rotateForItem(sender:)))
        tap.numberOfTapsRequired = 2
        $0.frame = CGRect(x: view.center.x-50, y: view.center.y-25, width: 100, height: 50)
        $0.backgroundColor = .systemPink
        $0.addGestureRecognizer(tap)
        $0.addGestureRecognizer(longPress)
        $0.addGestureRecognizer(pan)
        $0.addGestureRecognizer(pinch)
        $0.addGestureRecognizer(rotate)
        $0.tag = 1
        originPosition = $0.frame
        originTransform = $0.transform
        $0.addSubview(label)
        return $0
    }(UIView())
    
    lazy var label: UILabel = {
        $0.frame = CGRect(x: 5, y: 5, width: 90, height: 40)
        $0.backgroundColor = .white
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        navigationItem.title = "Test1"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
        view.addSubview(myView)
        service.token = "Test"
        NotificationCenter.default.addObserver(self, selector: #selector(setTitle(sender:)), name: .fm, object: nil)
    }
    
    @objc func setTitle(sender: Notification) {
        guard let data = sender.userInfo as? [String: String] else {return}
        label.text = data["name"]
    }
    
    @objc func pinchForItem(sender: UIPinchGestureRecognizer) {
        guard let gestView = sender.view else {return}
        gestView.transform = gestView.transform.scaledBy(x: sender.scale,
                                                         y: sender.scale)
        if sender.state == .ended {
            UIView.animate(withDuration: 3) {
                gestView.transform = self.originTransform!
            }
        }
        sender.scale = 1
    }
    
    @objc func tapForItem(sender: UITapGestureRecognizer) {
        guard sender.view != nil else {return}
        myView.frame = CGRect(x: view.center.x-100, y: 100, width: 200, height: 200)
    }
    
    @objc func panForItem(sender: UIPanGestureRecognizer) {
        guard let gestView = sender.view else {return}
        let translate = sender.translation(in: view)
        gestView.center = CGPoint(
            x: gestView.center.x+translate.x,
            y: gestView.center.y+translate.y
        )
        
        switch sender.state {
            
        case .began:
            print("")
            
        case .ended:
            if !gestView.frame.intersects(myView.frame) {
                UIView.animate(withDuration: 3) {
                    gestView.frame = self.originPosition!
                }
            }
            
        default:
            break
        }
        sender.setTranslation(.zero, in: view)
    }
    
    @objc func rotateForItem(sender: UIRotationGestureRecognizer) {
        guard let gestView = sender.view else {return}
        gestView.transform = gestView.transform.rotated(by: sender.rotation)
        sender.rotation = 0
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
