//
//  ViewController.swift
//  p5m3_2
//
//  Created by Amina TomasMart on 17.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    let service = Service()
    var news: [NewsItem] = []
    
    lazy var table: UITableView = {
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        $0.dataSource = self
        return $0
    }(UITableView(frame: view.frame))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(table)
        service.getNews(q: "swift", count: 10) { news in
            self.news = news
            DispatchQueue.main.async {
                self.table.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = news[indexPath.row].title
        return cell
    }
}


