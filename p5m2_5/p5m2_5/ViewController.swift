//
//  ViewController.swift
//  p5m2_5
//
//  Created by Amina TomasMart on 05.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var imagesPic: [UIImage] = []
    
    lazy var imagePicker = {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        return picker
    }()
    
    lazy var button = {
        let button = UIButton(primaryAction: action)
        let sizeW = view.frame.width-90
        let sizeH = view.frame.height-90
        button.frame.size = CGSize(width: 50, height: 50)
        button.frame.origin.x = sizeW
        button.frame.origin.y = sizeH
        button.backgroundColor = .red
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 25
        return button
    }()
    
    lazy var action = UIAction { _ in
        self.present(self.imagePicker, animated: true)
    }
    
    lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.frame = view.frame
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell2")
        table.dataSource = self
        table.delegate = self
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        showAttributed()
        view.addSubview(tableView)
        view.addSubview(button)
        
        
        func showAttributed() {
            navigationItem.title = "Мой блокнот"
            navigationItem.leftBarButtonItems = [
                UIBarButtonItem(systemItem: .edit, primaryAction: nil),
                UIBarButtonItem(systemItem: .add, primaryAction: nil)
            ]
            navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .camera, primaryAction: nil)
            navigationController?.navigationBar.prefersLargeTitles = true
            let attachment = NSTextAttachment(image: UIImage(systemName: "plus")!)
            attachment.bounds = CGRect(x: 50, y: .zero, width: 30, height: 30)
            attachment.image?.withTintColor(.red)
            let atrbt = [
                NSAttributedString.Key.foregroundColor: UIColor.red,
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 40, weight: .black),
                NSAttributedString.Key.kern: NSNumber(value: 10)
            ]
            navigationController?.navigationBar.largeTitleTextAttributes = atrbt
        }
    }
}
extension ViewController: UITableViewDataSource, UITableViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image =  info[.editedImage] as? UIImage {
            self.imagesPic.append(image)
            self.tableView.reloadData()
        }
        
        picker.dismiss(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return imagesPic.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.imageView?.image = imagesPic[indexPath.row]
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(imagesPic[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
}
