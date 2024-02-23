//
//  TabBarViewController.swift
//  PizzaDelivery
//
//  Created by Amina TomasMart on 13.01.2024.
//

import UIKit

final class TabBarViewController: UITabBarController {
    
    // Controllers
    private let menuVC = MenuViewController()
    private let contactsVC = ContactsViewController()
    private let profileVC = ProfileViewController()
    private let basketVC = BasketViewController()
    
    // Buttons
    private lazy var menuButton = getButton(icon: "Image 1", tag: 0, action: action, opacity: 1)
    private lazy var contactsButton = getButton(icon: "Image 2", tag: 1, action: action)
    private lazy var profileButton = getButton(icon: "Image 3", tag: 2, action: action)
    private lazy var basketButton = getButton(icon: "Image 4", tag: 3, action: action)

    lazy var action = UIAction { [weak self] sender in
        guard
            let sender = sender.sender as? UIButton,
            let self = self
        else {return}
        self.selectedIndex = sender.tag
        self.setOpacity(tag: sender.tag)
    }
    
    private lazy var customBar: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .equalSpacing
        $0.alignment = .center
        $0.frame = CGRect(x: .zero, y: view.frame.height - 80, width: view.frame.width, height: 30)
        
        $0.addArrangedSubview(UIView())
        $0.addArrangedSubview(menuButton)
        $0.addArrangedSubview(contactsButton)
        $0.addArrangedSubview(profileButton)
        $0.addArrangedSubview(basketButton)
        $0.addArrangedSubview(UIView())

        return $0
        
    }(UIStackView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(customBar)
        setViewControllers([menuVC, contactsVC, profileVC, basketVC], animated: true)
        
        // Do any additional setup after loading the view.
    }
    
    private func getButton(icon: String, tag: Int, action: UIAction, opacity: Float = 0.5) -> UIButton {
        return {
            $0.setImage(UIImage(named: icon), for: .normal)
            $0.tintColor = UIColor(hex: "#C3C4C9FF")
            $0.layer.opacity = opacity
            $0.tag = tag
            return $0
        }(UIButton(primaryAction: action))
    }
    
    private func setOpacity(tag: Int) {
        [menuButton, contactsButton, profileButton, basketButton].forEach { button in
            if button.tag != tag {
                button.layer.opacity = 0.5
                button.tintColor = UIColor(hex: "#C3C4C9FF")
            } else {
                button.layer.opacity = 1
                button.tintColor = UIColor(hex: "#FD3A69FF")
            }
        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
