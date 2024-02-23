//
//  TableViewCell.swift
//  JustMobyTest
//
//  Created by Evgenii Lukin on 20.12.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    private var arrayImages = ["Image1", "Image2","Image3", "Image4", "Image5"]
    private var pictArray = [UIImage]()
    private var randomArray = [UIImage]()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
 
    lazy var seeAllButton: UIButton = {
       let button = UIButton(type: .system)
        button.setTitle("See All", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(seeAllButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    lazy var backgroundCell: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let idRandomHeroCollectionView = "idRandomHeroCollectionView"
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        setupViews()
        setDelegates()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func seeAllButtonTapped() {
      print("Click")
    }
    
    private func setupViews() {
        
        backgroundColor = .clear
        selectionStyle = .none
        
        addSubview(backgroundCell)
        backgroundCell.addSubview(categoryLabel)
        backgroundCell.addSubview(seeAllButton)
        backgroundCell.addSubview(collectionView)
        
        collectionView.register(CollectionViewCell.self,
                                forCellWithReuseIdentifier: idRandomHeroCollectionView)
    }
    
    private func setDelegates() {
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func cellConfigure(model: CategoryModel) {
        categoryLabel.text = model.name
    }
    
    //MARK: - SetConstraints
    
    private func setConstraints() {

        NSLayoutConstraint.activate([
            
            backgroundCell.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            backgroundCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backgroundCell.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            categoryLabel.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 5),
            categoryLabel.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor, constant: 5),
            
            seeAllButton.centerYAnchor.constraint(equalTo: categoryLabel.centerYAnchor),
            seeAllButton.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -5),
            
            collectionView.topAnchor.constraint(equalTo: seeAllButton.bottomAnchor, constant: 5),
            collectionView.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor, constant: 3),
            collectionView.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -3),
            collectionView.bottomAnchor.constraint(equalTo: backgroundCell.bottomAnchor, constant: -5)
        ])
    }
}

//MARK: - UICollectionViewDataSource

extension TableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        arrayImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idRandomHeroCollectionView, for: indexPath) as! CollectionViewCell

        arrayImages.forEach { image in
            let images = UIImage(named: image)
            guard let images = images else { return }
            self.pictArray.append(images)
        }
        
        for _ in 0...6 {
            let randomInt = Int.random(in: 0...pictArray.count - 1)
            randomArray.append(pictArray[randomInt])
        }
        
        let ss = randomArray[indexPath.row]
        DispatchQueue.main.async() {
            cell.heroImageView.image = ss
        }
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension TableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 3,
               height: collectionView.frame.height - 25)
    }
}
