//
//  PhotoViewController.swift
//  HomeWork_9.2
//
//  Created by Amina TomasMart on 12.02.2024.
//

import UIKit

class PhotoViewController: UIViewController {
    
    var data: CollectionData?
    var originPosition: CGRect?
    
    lazy var myView: UIView = {
        let sizeW = view.bounds.width
        let sizeH = view.bounds.height
        $0.frame = CGRect(x: .zero, y: .zero, width: sizeW, height: sizeH)
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapForItem(sender:)))
        let pan = UIPanGestureRecognizer(target: self, action: #selector(panForItem(sender:)))
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(pinchForItem(sender:)))
        $0.addGestureRecognizer(tap)
        $0.addGestureRecognizer(pan)
        $0.addGestureRecognizer(pinch)
        tap.numberOfTapsRequired = 2
        $0.addSubview(image)
        return $0
    }(UIView())
    
    lazy var image: UIImageView = {
        let size = view.bounds.width/2
        let centerX = view.center.x-size/2
        let centerY = view.center.y-size/2
        $0.frame = CGRect(x: centerX, y: centerY, width: size, height: size)
        originPosition = $0.frame
        return $0
    }(UIImageView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = UIImage(named: data!.photo)
        view.backgroundColor = .systemGray6
        view.addSubview(myView)
    }
    
    @objc func tapForItem(sender: UITapGestureRecognizer) {
        guard sender.view != nil else {return}
        let size = view.bounds.width/2
        if image.frame.size == CGSize(width: size, height: size) {
            image.frame.size = CGSize(width: size*2, height: size*2)
        } else {
            image.frame.size = CGSize(width: size, height: size)
        }
    }
    @objc func panForItem(sender: UIPanGestureRecognizer) {
        guard let myView = sender.view else {return}
        let width = image.frame.width
        if width > originPosition!.width {
            let translate = sender.translation(in: view)
            myView.center = CGPoint(
                x: myView.center.x+translate.x,
                y: myView.center.y+translate.y
            )
            sender.setTranslation(.zero, in: view)
        }
    }
    
    @objc func pinchForItem(sender: UIPinchGestureRecognizer) {
        guard let myView = sender.view else {return}
        myView.transform = myView.transform.scaledBy(x: sender.scale, y: sender.scale)
        sender.scale = 1
    }
}

