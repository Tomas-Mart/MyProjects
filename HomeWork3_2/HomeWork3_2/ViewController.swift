//
//  ViewController.swift
//  HomeWork3_2
//
//  Created by Amina TomasMart on 17.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    let service = Service()
    var details: Details?
    
    lazy var table: UITableView = {
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        $0.dataSource = self
        return $0
    }(UITableView(frame: view.frame))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(table)
        service.getNews() { details in
            self.details = details
            DispatchQueue.main.async {
                self.table.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        details?.peculiarities?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = details?.peculiarities?[indexPath.row]
        return cell
    }
}
