//
//  NoteViewController.swift
//  p5m3_5
//
//  Created by Amina TomasMart on 21.02.2024.
//

import UIKit

class NoteViewController: UIViewController {
    
    private let manager = RealmManager()
    var folder: Folder?
    var notes: [Note] = []
    
    lazy var addNoteBtn: UIBarButtonItem = {
        return $0
    }(UIBarButtonItem(image: .add, style: .done, target: self, action: #selector(addNote)))
    
    private lazy var table: UITableView = {
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        $0.dataSource = self
        $0.delegate = self
        return $0
    }(UITableView(frame: view.bounds, style: .insetGrouped))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = folder?.folderName
        view.addSubview(table)
        navigationItem.rightBarButtonItem = addNoteBtn
        self.notes = Array(folder!.note)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let folder = folder else {return}
        manager.fetchNotes(folderID: folder.id)
        table.reloadData()
    }
    
    @objc func addNote() {
        let vc = AddNoteViewController()
        vc.folder = folder
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension NoteViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        manager.notes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = manager.notes?[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = AddNoteViewController()
        let note = manager.notes?[indexPath.row]
        vc.note = note
        vc.folder = folder
        navigationController?.pushViewController(vc, animated: true)
    }
}
