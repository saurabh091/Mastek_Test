//
//  MainTableViewCell.swift
//  Mastek_Test
//
//  Created by Saurabh Rana on 19/07/22.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    static let reuseIdentifier = "MainTableViewCell"
    var rowNumber: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 80, height: 80)
        flowLayout.minimumLineSpacing = 2.0
        flowLayout.minimumInteritemSpacing = 5.0
        collectionView.collectionViewLayout = flowLayout
        collectionView.showsHorizontalScrollIndicator = false
        
        // Comment if you set Datasource and delegate in .xib
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .green
        
        // Register the xib for collection view cell
        let cellNib = UINib(nibName: MainCollectionViewCell.reuseIdentifier, bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: MainCollectionViewCell.reuseIdentifier)
    }
    
    override func prepareForReuse() {
        //        self.backgroundColor = .yellow
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

extension MainTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // The data we passed from the TableView send them to the CollectionView Model
    //    func updateCellWith(row: [CollectionViewCellModel]) {
    //        self.rowWithColors = row
    //        self.collectionView.reloadData()
    //    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rowNumber
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // Set the data for each cell (color and color name)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.reuseIdentifier, for: indexPath) as? MainCollectionViewCell {
            //            cell.colorView.backgroundColor = self.rowWithColors?[indexPath.item].color ?? UIColor.black
            return cell
        }
        return UICollectionViewCell()
    }
    
    // Add spaces at the beginning and the end of the collection view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
}
