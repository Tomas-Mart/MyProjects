//
//  NamesTableViewCell.swift
//  DemoScroll
//
//  Created by Amina TomasMart on 27.01.2024.
//

import UIKit

class NamesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var titleList: UILabel!
    @IBOutlet weak var imageList: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

//struct Cell {
//    var images: String
//    var names: String
//    var details: String
//}
//
//extension Cell {
//    static func getCellList() -> [Cell] {
//        [
//            Cell(images: "1", names: "Пушинка", details: "Котя"),
//            Cell(images: "2", names: "Снежинка", details: "Мотя"),
//            Cell(images: "3", names: "Милашка", details: "Фотя"),
//            Cell(images: "4", names: "Мордашка", details: "Сотя"),
//            Cell(images: "5", names: "Цветочек", details: "Дотя")
//        ]
//    }
//}
