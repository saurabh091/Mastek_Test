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
    var sendRowIndexBack: ((_ index: Int, _ color: UIColor) ->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let cellWidth = CGFloat(self.frame.width - 40) / 5
        let cellHeight = CGFloat(80)
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        flowLayout.minimumLineSpacing = 0.0
        flowLayout.minimumInteritemSpacing = 0.0
        collectionView.collectionViewLayout = flowLayout
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // Register the xib for collection view cell
        let cellNib = UINib(nibName: MainCollectionViewCell.reuseIdentifier, bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: MainCollectionViewCell.reuseIdentifier)
    }
    
    override func prepareForReuse() {}
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension MainTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rowNumber
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // Set the data for each cell (color and color name)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.reuseIdentifier, for: indexPath) as? MainCollectionViewCell {
            // Remove this code
//            if indexPath.row % 2 == 0 { cell.backgroundColor = .green } else {
//                cell.backgroundColor = .yellow
//            }
            cell.roundButton.tag = indexPath.row
            cell.roundButton.addTarget(self, action: #selector(roundButtonTap(sender:)), for: .touchUpInside)
            return cell
        }
        return UICollectionViewCell()
    }
}

extension MainTableViewCell {
    @objc func roundButtonTap(sender: UIButton) {
        debugPrint("Circle Button Tag: \(sender.tag)")
        guard let cell = collectionView.cellForItem(at: IndexPath(item: sender.tag, section: 0)) as? MainCollectionViewCell else {
            return
        }
        sendRowIndexBack?(sender.tag, cell.roundButton.backgroundColor ?? .white)
    }
}
