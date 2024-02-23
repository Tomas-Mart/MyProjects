//
//  ProfileAppCode.swift
//  ProfileApp
//
//  Created by Amina TomasMart on 02.01.2024.
//

import UIKit

class ProfileAppCode: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let image = UIImageView()
        image.image = UIImage(named: "1")
        image.layer.cornerRadius = 20
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(image)
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            image.heightAnchor.constraint(equalTo: image.widthAnchor)
        ])
   
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.backgroundColor = UIColor.systemIndigo
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            button.topAnchor.constraint(equalTo: image.bottomAnchor, constant: -30),
            button.widthAnchor.constraint(equalToConstant: 40),
            button.heightAnchor.constraint(equalToConstant: 40)
        ])
   
        let labelName = UILabel()
        labelName.layer.opacity = 0.6
        labelName.textColor = UIColor.black
        labelName.font = UIFont(name: "Hiragino Maru Gothic ProN W4", size: 30)
        labelName.text = "Michelle,  23"
        labelName.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelName)
        NSLayoutConstraint.activate([
            labelName.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 30),
            labelName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            labelName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
   
        let labelCity = UILabel()
        labelCity.layer.opacity = 0.8
        labelCity.textColor = UIColor.systemIndigo
        labelCity.font = UIFont(name: "Hiragino Maru Gothic ProN W4", size: 18)
        labelCity.text = "San Francisco"
        labelCity.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelCity)
        NSLayoutConstraint.activate([
            labelCity.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 10),
            labelCity.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            labelCity.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
  
        let text = UITextView()
        text.layer.opacity = 0.7
        text.textColor = UIColor.systemGray
        text.font = UIFont(name: "Hiragino Maru Gothic ProN W4", size: 16)
        text.text = "It may measure less than 50 square miles and have a population that doesn’t even crack a million, but San Francisco justly ranks as one of the greatest cities in the world. Famous for grand-dame Victorians, cable cars, a dynamic waterfront, and a soaring golden bridge, this city truly has it all."
        text.isEditable = false
        text.isScrollEnabled = false
        text.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(text)
        NSLayoutConstraint.activate([
            text.topAnchor.constraint(equalTo: labelCity.bottomAnchor, constant: 30),
            text.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            text.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}
       
