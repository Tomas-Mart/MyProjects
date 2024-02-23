//
//  ViewController.swift
//  My project
//
//  Created by Amina TomasMart on 04.01.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let emojis = [
        Emoji(emoji: UIImage(named: "1")!, convenience: "Удобства"),
        Emoji(emoji: UIImage(named: "2")!, convenience: "Что включено"),
        Emoji(emoji: UIImage(named: "3")!, convenience: "Что не включено")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojis.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
        let emoji = emojis[indexPath.row]
        cell.emoji.image = emoji.emoji
        cell.convenience.text = emoji.convenience
        return cell
    }
    
}
class Cell: UITableViewCell {
    
    @IBOutlet weak var emoji: UIImageView!
    @IBOutlet weak var convenience: UILabel!
    @IBOutlet weak var necessary: UILabel!
    @IBOutlet weak var forward: UIImageView!
    
}
struct Emoji {
    var emoji: UIImage
    var convenience: String
}
