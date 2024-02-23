//
//  GalleryViewController.swift
//  DemoScroll
//
//  Created by Amina TomasMart on 27.01.2024.
//

import UIKit

class GalleryViewController: UIViewController {
    
//    let cellList = Cell.getCellList()
    var images = ["1", "2", "3", "4", "5"]
    var text = ["Снежинка", "Пушинка", "Солнышко", "Звездочка", "Милашка"]
    var detail = ["Снежинка", "Пушинка", "Солнышко", "Звездочка", "Милашка"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
extension GalleryViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.rowHeight = 55
        let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath) as! NamesTableViewCell
        cell.imageList.image = UIImage(named: images[indexPath.row])
        cell.titleList.text = text[indexPath.row]
        cell.subTitle.text = detail[indexPath.row]
//        let list = cellList[indexPath.row]
//        var content = cell.defaultContentConfiguration()
//        content.image = UIImage(named: list.images)
//        content.imageProperties.cornerRadius = tableView.rowHeight / 2
//        content.text = list.names
//        content.secondaryText = list.details
//        cell.accessoryType = .disclosureIndicator
//        cell.contentConfiguration = content
    
        return cell
    }
}

