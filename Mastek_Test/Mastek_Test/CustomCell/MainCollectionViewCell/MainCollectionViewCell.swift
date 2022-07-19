//
//  MainCollectionViewCell.swift
//  Mastek_Test
//
//  Created by Saurabh Rana on 19/07/22.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "MainCollectionViewCell"
    @IBOutlet weak var roundButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        roundButton.backgroundColor = .random
    }
}
