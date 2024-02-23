//
//  AddNoteViewController.swift
//  p5m3_5
//
//  Created by Amina TomasMart on 21.02.2024.
//

import UIKit

class AddNoteViewController: UIViewController {
    
    private let viewHelper = ViewHelper()
    private let realm = RealmManager()
    var folder: Folder?
    var note: Note?
    var titleFielf: UITextField!
    var contentField: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Note change"
        setView()
    }
    
    private func setView() {
        view.backgroundColor = .white
        titleFielf = viewHelper.textField(placeholder: "Заголовок")
        contentField = viewHelper.textEdit()
        let addButton = viewHelper.addButton(title: "Сохранить")
        view.addSubview(titleFielf)
        view.addSubview(contentField)
        view.addSubview(addButton)
        
        NSLayoutConstraint.activate([
            
            titleFielf.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleFielf.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleFielf.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            titleFielf.heightAnchor.constraint(equalToConstant: 50),
            
            contentField.topAnchor.constraint(equalTo: titleFielf.bottomAnchor, constant: 20),
            contentField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            contentField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            contentField.heightAnchor.constraint(equalToConstant: 100),
            
            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            addButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        
        addButton.addTarget(self, action: #selector(saveNote), for: .touchUpInside)
        
        if note != nil {
            titleFielf.text = note!.title
            contentField.text = note!.noteText
        }
    }
    
    @objc private func saveNote() {
        let newNote = Note()
        newNote.title = titleFielf.text ?? ""
        newNote.noteText = contentField.text ?? ""
        if note != nil {
            realm.updateNote(id: note!.id, newNote: newNote)
        } else {
            realm.addNote(folderID: folder!.id, note: newNote)
        }
        
        navigationController?.popViewController(animated: true)
    }
}

class ViewHelper {
    
    func textField(placeholder: String) -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.backgroundColor = .systemGray6
        textField.placeholder = placeholder
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 10
        textField.textAlignment = .center
        return textField
    }
    
    func textEdit() -> UITextView {
        let text = UITextView(frame: .zero)
        text.backgroundColor = .systemGray6
        text.layer.cornerRadius = 10
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = UIFont.systemFont(ofSize: 16)
        return text
    }
    
    func addButton(title: String) -> UIButton {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        return button
    }
}

