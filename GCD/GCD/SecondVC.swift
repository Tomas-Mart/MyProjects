//
//  SecondVC.swift
//  GCD
//
//  Created by Amina TomasMart on 22.12.2023.
//

import UIKit

class SecondVC: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndikator: UIActivityIndicatorView!
    fileprivate var imageUrl: URL?
    fileprivate var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            activityIndikator.startAnimating()
            activityIndikator.isHidden = true
            imageView.image = newValue
            imageView.sizeToFit()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchImage()
        delay(3) {
            self.loginAlert()
        }
    }
    fileprivate func delay(_ delay: Int, closure: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delay)) {
            closure()
        }
    }
    fileprivate func loginAlert() {
        let ac = UIAlertController(title: "Зарегистрированы?", message: "Введите ваш логин и пароль", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "Отмена", style: .default, handler: nil)
        
        ac.addAction(okAction)
        ac.addAction(cancelAction)
        
        ac.addTextField { (userNameTF) in
            userNameTF.placeholder = "Введите логин"
        }
        ac.addTextField { (userPasswordTF) in
            userPasswordTF.placeholder = "Введите пароль"
            userPasswordTF.isSecureTextEntry = true
        }
        self.present(ac, animated: true, completion: nil)
    }
    fileprivate func fetchImage() {
        imageUrl = URL(string: "https://upload.wikimedia.org/wikipedia/commons/7/7a/Basketball.png")
        activityIndikator.isHidden = false
        activityIndikator.startAnimating()
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            guard let url = self.imageUrl, let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: imageData)
            }
        }
    }
}
