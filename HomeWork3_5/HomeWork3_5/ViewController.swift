//
//  ViewController.swift
//  HomeWork3_5
//
//  Created by Amina TomasMart on 20.02.2024.
//
import UIKit

class ViewController: UIViewController {
    
    private let manager = MyRealmManager()
    private let file = MyFileManager()
    private lazy var myBuilder: Gallery = {
        return $0
    }(Gallery(view: self.view, dataSource: self, delegate: self))
    
    private lazy var imagePicker:  UIImagePickerController = {
        $0.sourceType = .photoLibrary
        $0.allowsEditing = true
        $0.delegate = self
        return $0
    }(UIImagePickerController())
    
    private lazy var button: UIButton  = {
        let sizeW = view.frame.width-90
        let sizeH = view.frame.height-90
        $0.frame.size = CGSize(width: 50, height: 50)
        $0.frame.origin.x = sizeW
        $0.frame.origin.y = sizeH
        $0.backgroundColor = .red
        $0.setTitle("+", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 25
        return $0
    }(UIButton(primaryAction: action))
    
    lazy var action = UIAction { [weak self] _ in
        guard let self = self else {return}
        self.present(self.imagePicker, animated: true)
    }
    private lazy var collection = myBuilder.createGallery()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(collection)
        view.addSubview(button)
        print(file.urlPath())
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let imagePic =  info[.editedImage] as? UIImage {
            let photoName = UUID().uuidString + ".jpg"
            manager.addPhoto(photoName: photoName)
            
            guard let imageData = imagePic.jpegData(compressionQuality: 0.5) else {return}
            file.saveImage(imageName: photoName, imageData: imageData)
            
            
        }
        
        collection.reloadData()
        picker.dismiss(animated: true)
        
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return manager.photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.reuseID, for: indexPath) as! Cell
        let imageName = manager.photos[indexPath.item].imageName
        let imageData = file.loadImage(fileName: imageName)
        cell.setImage(imageData: imageData)
        return cell
    }
}
