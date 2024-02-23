//
//  MainViewController.swift
//  JustMobyTest
//
//  Created by Evgenii Lukin on 19.12.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Banner")
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 3.5
        imageView.layer.cornerRadius = 25
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .none
        tableView.bounces = false
        tableView.separatorColor = .white
        tableView.showsVerticalScrollIndicator = true
        tableView.delaysContentTouches = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let idTableViewCell = "idTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTitle()
        setupViews()
        setDelegates()
        setConstraints()
    }
    
    private func setupViews() {
        
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.addSubview(imageView)
        view.addSubview(tableView)
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: idTableViewCell)
    }
    
    private func setTitle() {
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        label.text = "Home"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        self.navigationItem.titleView = label
    }
    
    private func setDelegates() {
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

//MARK: - UITableViewDataSource

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categoryModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: idTableViewCell, for: indexPath) as?
                TableViewCell else {return UITableViewCell()}
        
        let model = categoryModel[indexPath.row]
        cell.cellConfigure(model: model)
        return cell
    }
}

//MARK: - UITableViewDelegate

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
}

//MARK: - SetConstraints

extension MainViewController {
    
    private func setConstraints() {
        
        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                
                imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
                imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
                imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
                imageView.heightAnchor.constraint(equalToConstant: 150),
                
                tableView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
                tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
            ])
        } else {
            // Fallback on earlier versions
        }
    }
}
