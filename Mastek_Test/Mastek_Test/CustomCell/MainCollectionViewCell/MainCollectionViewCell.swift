//
//  MainCollectionViewCell.swift
//  Mastek_Test
//
//  Created by Saurabh Rana on 19/07/22.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {

    static let reuseIdentifier = "MainCollectionViewCell"
    @IBOutlet weak var button: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = .yellow
    }
}
