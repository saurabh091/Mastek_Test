//
//  MainTableViewCell.swift
//  Mastek_Test
//
//  Created by Saurabh Rana on 19/07/22.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var rowNumber: Int = 0
    var sendRowIndexBack: ((_ index: Int, _ color: UIColor) ->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupCell()
    }
    
    func setupCell() {
        let cellWidth = (self.frame.width - Constant.sideSpace) / Constant.cellCount
        let cellHeight = Constant.cellHeight
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        flowLayout.minimumLineSpacing = Constant.minimumSpacing
        flowLayout.minimumInteritemSpacing = Constant.minimumSpacing
        collectionView.collectionViewLayout = flowLayout
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // Register the xib for collection view cell
        collectionView.register(UINib(nibName: Constant.mainCVCellIdentifier, bundle: nil), forCellWithReuseIdentifier: Constant.mainCVCellIdentifier)
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
        return Constant.tableViewSection
    }
    
    // Set the data for each cell (color and color name)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.mainCVCellIdentifier, for: indexPath) as? MainCollectionViewCell {
            cell.roundButton.tag = indexPath.row
            cell.roundButton.addTarget(self, action: #selector(roundButtonTap(sender:)), for: .touchUpInside)
            return cell
        }
        return UICollectionViewCell()
    }
}

extension MainTableViewCell {
    @objc func roundButtonTap(sender: UIButton) {
        guard let cell = collectionView.cellForItem(at: IndexPath(item: sender.tag, section: 0)) as? MainCollectionViewCell else {
            return
        }
        sendRowIndexBack?(sender.tag, cell.roundButton.backgroundColor ?? .white)
    }
}
