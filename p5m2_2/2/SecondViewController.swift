//
//  SecondViewController.swift
//  2
//
//  Created by Amina TomasMart on 31.01.2024.
//

import UIKit

class SecondViewController: UIViewController {
    
    private let mainVStack = UIStackView()
    let screen = UIScreen()
    var delegate: ViewControllerDelegate?
    
    
    lazy var textField1 = {
        let field = UITextField(frame: CGRect(x: 30, y: 100, width: 162, height: 55))
        field.placeholder = "Число 1"
        field.drawPlaceholder(in: CGRect(x: screen.bounds.width/2 + 50, y: 100, width: 100, height: 20))
        field.textAlignment = .center
        field.backgroundColor = .white
        
        return field
    }()
    
    lazy var textField2 = {
        let field = UITextField(frame: CGRect(x: 200, y: 100, width: 162, height: 55))
        field.placeholder = "Число 2"
        field.drawPlaceholder(in: CGRect(x: screen.bounds.width/2 + 50, y: 100, width: 100, height: 20))
        field.textAlignment = .center
        field.backgroundColor = .white
        
        return field
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Ввести данные"
        view.backgroundColor = .systemGray6
        view.addSubview(textField1)
        view.addSubview(textField2)
        setupButtons()
        setupMainVStack()
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
        let tfLeft = Int(textField1.text ?? "") ?? 0
        let tfRight = Int(textField2.text ?? "") ?? 0
        switch sender.tag {
        case 0:
            let result = tfLeft + tfRight
            delegate?.setText(text: "\(tfLeft) + \(tfRight) = \(result)")
        case 1:
            let result = tfLeft - tfRight
            delegate?.setText(text: "\(tfLeft) - \(tfRight) = \(result)")
        case 2:
            if tfRight != 0 && tfRight.words.isEmpty != true {
                let result = tfLeft / tfRight
                delegate?.setText(text: "\(tfLeft) / \(tfRight) = \(result)")
            } else {
                print("На 0 делить нельзя")
            }
        case 3:
            let result = tfLeft * tfRight
            delegate?.setText(text: "\(tfLeft) * \(tfRight) = \(result)")
        default:
            break
        }
        if tfLeft == 0 && tfRight == 0 {
            delegate?.setText(text: "")
        }
    }
    
    func setupMainVStack() {
        mainVStack.axis = .horizontal
        mainVStack.frame = CGRect(x: 0, y: 250, width: Constants.screenWidth, height: 80)
        self.view.addSubview(mainVStack)
    }
    
    func setupButtons() {
        let additionButton = createButton(order: 0, title: "+", tag: 0)
        additionButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let substractionButton = createButton(order: 1, title: "-", tag: 1)
        substractionButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let divisionButton = createButton(order: 2, title: "/", tag: 2)
        divisionButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let multiplicftionButton = createButton(order: 3, title: "*", tag: 3)
        multiplicftionButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        mainVStack.addSubview(additionButton)
        mainVStack.addSubview(substractionButton)
        mainVStack.addSubview(divisionButton)
        mainVStack.addSubview(multiplicftionButton)
    }
    
    func createButton(order: Int, title: String, tag: Int) -> UIButton {
        let size = Int(Constants.screenWidth/4)
        let button = UIButton(frame: CGRect(x: (0+size*order+10), y: 0, width: size-20, height: size-20))
        button.setTitle(title, for: .normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.setTitleColor(.white, for: .normal)
        button.tag = tag
        return button
    }
}
