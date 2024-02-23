//
//  ViewController.swift
//  TestProject
//
//  Created by Amina TomasMart on 25.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var lable = UILabel()
    var textUser = UITextField()
    var textPassword = UITextField()
    var button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        displayingLayout()
    }
    
    func displayingLayout() {
        configLable()
        configTextUser()
        configTextPassword()
        configButton()
        addToView()
        addConstraints()
    }
    
    func configLable() {
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "Регистрация"
        lable.textAlignment = .center
        lable.font = .systemFont(ofSize: 30, weight: .bold)
    }
    
    func configTextUser() {
        textUser.translatesAutoresizingMaskIntoConstraints = false
        textUser.backgroundColor = .white
        textUser.clearButtonMode = .always
        textUser.placeholder = "Введите ваше имя"
    }
    
    func configTextPassword() {
        textPassword.translatesAutoresizingMaskIntoConstraints = false
        textPassword.backgroundColor = .white
        textPassword.clearButtonMode = .always
        textPassword.placeholder = "Введите ваш пароль"
        textPassword.isSecureTextEntry = true
    }
    
    func configButton() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 15
        button.setTitle("Войти", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    }
    
    @objc func tapButton() {
        let testVC = TestViewController()
        present (testVC, animated: true)
    }
    
    func addToView() {
        view.addSubview(lable)
        view.addSubview(textUser)
        view.addSubview(textPassword)
        view.addSubview(button)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            
            lable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            lable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lable.heightAnchor.constraint(equalToConstant: 50),
            lable.widthAnchor.constraint(equalToConstant: 300),
            
            textUser.topAnchor.constraint(equalTo: lable.bottomAnchor, constant: 180),
            textUser.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textUser.heightAnchor.constraint(equalToConstant: 30),
            textUser.widthAnchor.constraint(equalToConstant: 300),
            
            textPassword.topAnchor.constraint(equalTo: textUser.bottomAnchor, constant: 10),
            textPassword.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textPassword.heightAnchor.constraint(equalToConstant: 30),
            textPassword.widthAnchor.constraint(equalToConstant: 300),
            
            button.topAnchor.constraint(equalTo: textPassword.bottomAnchor, constant: 50),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
}

