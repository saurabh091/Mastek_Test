//
//  CustomHeader.swift
//  Mastek_Test
//
//  Created by Saurabh Rana on 19/07/22.
//

import UIKit

protocol CustomHeaderDelegate: AnyObject {
    func customHeader(_ customHeader: CustomHeader, didTapButtonInSection section: Int)
}

class CustomHeader: UITableViewHeaderFooterView {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 80, height: 80)
        layout.minimumLineSpacing = 2.0
        layout.minimumInteritemSpacing = 5.0
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = UIColor.red
        return cv
    }()
    
    static let reuseIdentifier = "CustomHeader"
    weak var delegate: CustomHeaderDelegate?
    var rows: Int!
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = .orange
        debugPrint("###############################################################")
        setupUI()
    }
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        self.backgroundColor = .yellow
        debugPrint("###### DRAW ################################################")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //custom logic goes here
        debugPrint("###### awakeFromNib ################################################")
    }
    
    func setupUI() {
        self.addSubview(collectionView)
        updateCollectionViewConstraints()
        collectionView.showsHorizontalScrollIndicator = false
        
        // Comment if you set Datasource and delegate in .xib
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // Register the xib for collection view cell
        let cellNib = UINib(nibName: "MainCollectionViewCell", bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: "MainCollectionViewCell")
    }
    
    func updateCollectionViewConstraints() {
        collectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        collectionView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
        collectionView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 5).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 5).isActive = true
    }
}

extension CustomHeader: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rows
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // Set the data for each cell (color and color name)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as? MainCollectionViewCell {
            //            cell.colorView.backgroundColor = self.rowWithColors?[indexPath.item].color ?? UIColor.black
            //            cell.nameLabel.text = self.rowWithColors?[indexPath.item].name ?? ""
            cell.backgroundColor = .systemBlue
            return cell
        }
        return UICollectionViewCell()
    }
    
    // Add spaces at the beginning and the end of the collection view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
}
