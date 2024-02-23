//
//  ViewController.swift
//  p5m3_5
//
//  Created by Amina TomasMart on 19.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private let manager = RealmManager()
    
    private lazy var table: UITableView = {
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        $0.dataSource = self
        $0.delegate = self
        return $0
    }(UITableView(frame: view.bounds, style: .insetGrouped))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(table)
        title = "Folder"
        print(FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask).first!)
    }
    
    @IBAction func addNote(_ sender: Any) {
        let alert = UIAlertController(title: "add note", message: nil, preferredStyle: .alert)
        
        alert.addTextField { text in
            text.placeholder = "Folder name"
        }
        
        let saveBtn = UIAlertAction(title: "Save", style: .default) { _ in
            let folderName = alert.textFields?[0].text ?? ""
            self.manager.addFolder(folderName: folderName)
            self.table.reloadData()
        }
        
        let closeBtn = UIAlertAction(title: "Close", style: .destructive)
        alert.addAction(saveBtn)
        alert.addAction(closeBtn)
        self.present(alert, animated: true)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        manager.folders?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = manager.folders?[indexPath.row].folderName ?? ""
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let noteVC = NoteViewController()
        noteVC.folder = manager.folders?[indexPath.row]
        navigationController?.pushViewController(noteVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            manager.deleteFolder(folderID: manager.folders?[indexPath.row].id ?? "")
            table.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

