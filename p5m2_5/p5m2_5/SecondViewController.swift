//
//  SecondViewController.swift
//  p5m2_5
//
//  Created by Amina TomasMart on 05.02.2024.
//

import UIKit

class SecondViewController: UIViewController {
    
    lazy var imagePicker = {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        return picker
    }()
    
    lazy var imageView = {
        let image = UIImageView()
        image.backgroundColor = .gray
        image.frame.size = CGSize(width: 100, height: 100)
        image.frame.origin.y = 100
        image.center.x = view.center.x
        image.layer.cornerRadius = 50
        image.clipsToBounds = true
        return image
    }()
    
    lazy var textView = {
        let text = UITextView()
        text.frame.size = CGSize(width: view.frame.width-60, height: view.frame.height/2)
        text.center.x = view.center.x
        text.center.y = view.center.y
        text.layer.cornerRadius = 20
        text.backgroundColor = .systemGray6
        text.font = UIFont.systemFont(ofSize: 16)
        return text
    }()
    
    lazy var button = {
        let button = UIButton(primaryAction: action)
        let size = view.frame.width-60
        button.frame.size = CGSize(width: size, height: 50)
        button.frame.origin.y = view.frame.height-100
        button.center.x = view.center.x
        button.backgroundColor = .black
        button.setTitle("select image", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 20
        return button
    }()
    
    lazy var action = UIAction { _ in
        self.present(self.imagePicker, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(imageView)
        view.addSubview(textView)
        view.addSubview(button)
        
    }
}
extension SecondViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image =  info[.editedImage] as? UIImage {
            self.imageView.image = image
        }
        
        picker.dismiss(animated: true)
    }
}
