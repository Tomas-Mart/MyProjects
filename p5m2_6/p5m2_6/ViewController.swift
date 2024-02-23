//
//  ViewController.swift
//  p5m2_6
//
//  Created by Amina TomasMart on 05.02.2024.
//

import UIKit

final class ViewController: UIViewController {
    
    private let tableData: [TableData] = TableData.getTableData()
    
    private lazy var table: UITableView = {
        .config($0) {
            $0.register(PostCell.self, forCellReuseIdentifier: PostCell.reuseID)
            $0.dataSource = self
            $0.delegate = self
        }
    }(UITableView(frame: self.view.frame, style: .plain))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(table)
    }
    
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.reuseID, for: indexPath) as? PostCell else { return UITableViewCell()
        }
        cell.configCell(data: tableData[indexPath.row])
        cell.block = { [weak self] in
            let vc = DetailsViewController()
            vc.data = self?.tableData[indexPath.row]
            self?.navigationController?.pushViewController(vc, animated: true)
        }
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
