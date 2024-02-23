//
//  ViewController.swift
//  HomeWork_3
//
//  Created by Amina TomasMart on 04.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var lableName = UILabel()
    var labelDetail = UILabel()
    var topImage = UIImageView()
    var myView = UIView()
    var labelModel = UILabel()
    var textView = UILabel()
    var button = UIButton()
    
    let imagesTop = [
        UIImage(named: "3")!,
        UIImage(named: "4")!
    ]
    
    let imagesBot = [
        UIImage(named: "1")!,
        UIImage(named: "2")!
    ]
    
    lazy var hStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 10
        imagesBot.forEach {
            let image = self.getImage(image: $0)
            stack.addArrangedSubview(image)
        }
        
        return stack
    }()
    
    lazy var vStackLeft: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 20
        imagesBot.forEach {
            let image = self.getImageTop(image: $0)
            stack.addArrangedSubview(image)
        }
        
        return stack
    }()
    
    lazy var vStackRight: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 20
        imagesTop.forEach {
            let image = self.getImageTop(image: $0)
            stack.addArrangedSubview(image)
        }
        
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1764706075, green: 0.1764706075, blue: 0.1764706075, alpha: 1)
        displayingLayout()
    }
    
    private func getImageTop(image: UIImage) -> UIImageView {
        let myImage = UIImageView()
        myImage.translatesAutoresizingMaskIntoConstraints = false
        myImage.heightAnchor.constraint(equalToConstant: 70).isActive = true
        myImage.widthAnchor.constraint(equalToConstant: 70).isActive = true
        myImage.image = image
        myImage.contentMode = .scaleAspectFill
        myImage.layer.cornerRadius = 35
        myImage.clipsToBounds = true
        return myImage
    }
    
    private func getImage(image: UIImage) -> UIImageView {
        let myImage = UIImageView()
        myImage.translatesAutoresizingMaskIntoConstraints = false
        myImage.widthAnchor.constraint(equalToConstant: view.frame.width/2-25).isActive = true
        myImage.heightAnchor.constraint(equalToConstant: view.frame.width/2-25).isActive = true
        myImage.image = image
        myImage.contentMode = .scaleAspectFill
        myImage.layer.cornerRadius = 20
        myImage.clipsToBounds = true
        return myImage
    }
    
    func displayingLayout() {
        configLableName()
        configLabelDetail()
        configTopImage()
        configMyView()
        configLabelModel()
        configTextView()
        configButton()
        addToView()
        addConstraints()
    }
    
    func configLableName() {
        lableName.translatesAutoresizingMaskIntoConstraints = false
        lableName.text = "MotoApp"
        lableName.textColor = .white
        lableName.textAlignment = .left
        lableName.font = .systemFont(ofSize: 32, weight: .bold)
    }
    
    func configLabelDetail() {
        labelDetail.translatesAutoresizingMaskIntoConstraints = false
        labelDetail.text = "description"
        labelDetail.textColor = #colorLiteral(red: 0.4470587969, green: 0.4470587969, blue: 0.4470587969, alpha: 1)
        labelDetail.textAlignment = .left
        labelDetail.font = .systemFont(ofSize: 16, weight: .bold)
    }
    
    func configTopImage() {
        topImage.translatesAutoresizingMaskIntoConstraints = false
        topImage.image = UIImage(named: "1")
        topImage.contentMode = .scaleAspectFill
        topImage.layer.cornerRadius = 35
        topImage.clipsToBounds = true
    }
    
    func configMyView() {
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.9098039269, blue: 0.9098039269, alpha: 1)
        myView.layer.cornerRadius = 15
    }
    
    func configLabelModel() {
        labelModel.translatesAutoresizingMaskIntoConstraints = false
        labelModel.text = "gt-500"
        labelModel.numberOfLines = 0
        labelModel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        labelModel.font = .systemFont(ofSize: 20, weight: .bold)
    }
    
    func configTextView() {
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmods"
        textView.numberOfLines = 0
        textView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        textView.font = .systemFont(ofSize: 16, weight: .regular)
    }
    
    func configButton() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 0.005186697934, green: 0.6609725952, blue: 0.0306688305, alpha: 1)
        button.layer.cornerRadius = 20
        button.setTitle("next", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }
    
    func addToView() {
        
        view.addSubview(lableName)
        view.addSubview(labelDetail)
        view.addSubview(vStackLeft)
        view.addSubview(vStackRight)
        view.addSubview(myView)
        myView.addSubview(labelModel)
        myView.addSubview(textView)
        view.addSubview(hStack)
        view.addSubview(button)
    }
    
    func addConstraints() {
        
        NSLayoutConstraint.activate([
            
            lableName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            lableName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            labelDetail.topAnchor.constraint(equalTo: lableName.bottomAnchor, constant: 10),
            labelDetail.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            vStackLeft.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            vStackLeft.trailingAnchor.constraint(equalTo: vStackRight.trailingAnchor, constant: -90),
            vStackLeft.widthAnchor.constraint(equalToConstant: 70),
            
            vStackRight.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            vStackRight.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            vStackRight.widthAnchor.constraint(equalToConstant: 70),
            
            myView.topAnchor.constraint(equalTo: vStackRight.bottomAnchor, constant: 30),
            myView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            myView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            labelModel.topAnchor.constraint(equalTo: myView.topAnchor, constant: 20),
            labelModel.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 10),
            labelModel.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -10),
            
            textView.topAnchor.constraint(equalTo: labelModel.bottomAnchor),
            textView.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 10),
            textView.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -10),
            textView.bottomAnchor.constraint(equalTo: myView.bottomAnchor, constant: -20),
            
            hStack.topAnchor.constraint(equalTo: myView.bottomAnchor, constant: 20),
            hStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            hStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            hStack.heightAnchor.constraint(equalToConstant: view.frame.width/2-25),
            
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            button.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}


