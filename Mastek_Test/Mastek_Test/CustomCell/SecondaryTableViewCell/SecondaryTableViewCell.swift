//
//  SecondaryTableViewCell.swift
//  Mastek_Test
//
//  Created by Saurabh Rana on 19/07/22.
//

import UIKit

class SecondaryTableViewCell: UITableViewCell {

    static let reuseIdentifier = "SecondaryTableViewCell"
    @IBOutlet weak var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
