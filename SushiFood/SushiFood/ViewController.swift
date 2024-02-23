//
//  ViewController.swift
//  SushiFood
//
//  Created by Amina TomasMart on 05.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var delivery: UILabel!
    
    private var gallery = Gallery()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(gallery)
        gallery.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        gallery.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        gallery.topAnchor.constraint(equalTo: delivery.bottomAnchor, constant: 10).isActive = true
        gallery.heightAnchor.constraint(equalToConstant: 350).isActive = true
        
        gallery.set(cells: SushiModel.fetchSushi())
    }
    
    
}

class Gallery: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var cells = [SushiModel]()
    
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super .init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = .white
        delegate = self
        dataSource = self
        register(Cell.self, forCellWithReuseIdentifier: Cell.reuseID)
        
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = CGFloat(Constants.galleryMinimumLineSpacing)
        contentInset = UIEdgeInsets(top: 0, left: CGFloat(Constants.leftDistanceToView), bottom: 0,
                                    right: CGFloat(Constants.rightDistanceToView))
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
    }
    
    func set(cells: [SushiModel]) {
        self.cells = cells
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: Cell.reuseID, for: indexPath) as! Cell
        cell.myImageView.image = cells[indexPath.row].myImageView
        cell.nameSushi.text = cells[indexPath.row].nameSushi
        cell.cost.text = cells[indexPath.row].cost
        cell.numberFood.text = cells[indexPath.row].numberFood
        cell.orderFood.text = cells[indexPath.row].orderFood
        cell.weightSushi.text = cells[indexPath.row].weightSushi
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.galleryItemWidth, height: frame.height * 0.8)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class Cell: UICollectionViewCell {
    
    static let reuseID = "Cell"
    
    let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let nameSushi: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .red
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let orderFood: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .white
        label.backgroundColor = .red
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let likeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "like")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let cost: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .light)
        label.textColor = .red
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let numberFood: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let weightSushi: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(numberFood)
        addSubview(weightSushi)
        addSubview(myImageView)
        addSubview(nameSushi)
        addSubview(likeImage)
        addSubview(cost)
        addSubview(orderFood)

        backgroundColor = .white
        
        myImageView.topAnchor.constraint(equalTo: topAnchor, constant: 30).isActive = true
        myImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        myImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        myImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/3).isActive = true
        
        nameSushi.topAnchor.constraint(equalTo: myImageView.bottomAnchor, constant: 10).isActive = true
        nameSushi.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        nameSushi.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        weightSushi.topAnchor.constraint(equalTo: nameSushi.bottomAnchor, constant: 10).isActive = true
        weightSushi.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        weightSushi.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        cost.topAnchor.constraint(equalTo: weightSushi.bottomAnchor, constant: 10).isActive = true
        cost.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        cost.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        cost.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        orderFood.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        orderFood.centerYAnchor.constraint(equalTo: cost.centerYAnchor).isActive = true
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 5
        self.layer.shadowRadius = 9
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 5, height: 8)
        self.clipsToBounds = false
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

struct SushiModel {
    
    var numberFood: String
    var weightSushi: String
    var myImageView: UIImage
    var nameSushi: String
    var cost: String
    var orderFood: String
    
    
    static func fetchSushi() -> [SushiModel] {
        
        let item1 = SushiModel(numberFood: "№ 1", weightSushi: "40 г.", myImageView: UIImage(named: "1")!, nameSushi: "Суши Нигири с лососем", cost: "130 p.", orderFood: "Заказать")
        
        let item2 = SushiModel(numberFood: "№ 2", weightSushi: "40 г.", myImageView: UIImage(named: "2")!, nameSushi: "Суши Нигири с копченым лососем", cost: "140 p.", orderFood: "Заказать")
        
        let item3 = SushiModel(numberFood: "№ 3", weightSushi: "40 г.", myImageView: UIImage(named: "3")!, nameSushi: "Суши Нигири с тунцом", cost: "150 p.", orderFood: "Заказать")
        
        let item4 = SushiModel(numberFood: "№ 4", weightSushi: "40 г.", myImageView: UIImage(named: "4")!, nameSushi: "Суши Нигири с креветкой", cost: "160 p.", orderFood: "Заказать")
        
        let item5 = SushiModel(numberFood: "№ 5", weightSushi: "40 г.", myImageView: UIImage(named: "5")!, nameSushi: "Суши Нигири с угрем", cost: "170 p.", orderFood: "Заказать")
        
        let item6 = SushiModel(numberFood: "№ 6", weightSushi: "40 г.", myImageView: UIImage(named: "6")!, nameSushi: "Суши Гункан с водорослями чука", cost: "180 p.", orderFood: "Заказать")
        
        let item7 = SushiModel(numberFood: "№ 7", weightSushi: "40 г.", myImageView: UIImage(named: "7")!, nameSushi: "Суши Гункан с икрой летучей мыши", cost: "190 p.", orderFood: "Заказать")
        
        let item8 = SushiModel(numberFood: "№ 8", weightSushi: "40 г.", myImageView: UIImage(named: "8")!, nameSushi: "Суши Гункан с имитацией икры лосося", cost: "180 p.", orderFood: "Заказать")
        
        let item9 = SushiModel(numberFood: "№ 9", weightSushi: "40 г.", myImageView: UIImage(named: "9")!, nameSushi: "Суши Гункан с лососем и сыром", cost: "170 p.", orderFood: "Заказать")
        
        let item10 = SushiModel(numberFood: "№ 10", weightSushi: "40 г.", myImageView: UIImage(named: "10")!, nameSushi: "Суши Гункан с копченым лососем", cost: "160 p.", orderFood: "Заказать")
        
        let item11 = SushiModel(numberFood: "№ 11", weightSushi: "40 г.", myImageView: UIImage(named: "11")!, nameSushi: "Суши Гункан с угрем и сыром", cost: "150 p.", orderFood: "Заказать")
        
        let item12 = SushiModel(numberFood: "№ 12", weightSushi: "40 г.", myImageView: UIImage(named: "12")!, nameSushi: "Суши Гункан острый с лососем", cost: "140 p.", orderFood: "Заказать")
        
        let item13 = SushiModel(numberFood: "№ 13", weightSushi: "40 г.", myImageView: UIImage(named: "13")!, nameSushi: "Суши Гункан острый с тунцом", cost: "130 p.", orderFood: "Заказать")
        
        let item14 = SushiModel(numberFood: "№ 14", weightSushi: "40 г.", myImageView: UIImage(named: "14")!, nameSushi: "Суши Гункан острый с угрем", cost: "150 p.", orderFood: "Заказать")
        
        let item15 = SushiModel(numberFood: "№ 15", weightSushi: "40 г.", myImageView: UIImage(named: "15")!, nameSushi: "Суши Гункан Цезарь", cost: "170 p.", orderFood: "Заказать")
        
        return [item1, item2, item3, item4, item5, item6, item7, item8, item9, item10, item11, item12, item13, item14, item15]
    }
}
struct Constants {
    static let leftDistanceToView: CGFloat = 16
    static let rightDistanceToView: CGFloat = 16
    static let galleryMinimumLineSpacing: CGFloat = 10
    static let galleryItemWidth = (UIScreen.main.bounds.width - Constants.leftDistanceToView - Constants.rightDistanceToView - (Constants.galleryMinimumLineSpacing / 2)) / 2
}
