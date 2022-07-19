//
//  ResultViewController.swift
//  Mastek_Test
//
//  Created by Saurabh Rana on 19/07/22.
//

import UIKit

class ResultViewController: UIViewController {
    
    var backGroundColor: UIColor?
    var row: Int?
    var collectionIndex: Int?
    @IBOutlet weak var rowIndexLabel: UILabel!
    @IBOutlet weak var collectionIndexLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        if let color = backGroundColor {
            view.backgroundColor = color
        } else {
            debugPrint("backGroundColor is nil.")
        }
        
        if let rowIndex = row {
            rowIndexLabel.isHidden = false
            rowIndexLabel.text = "\(Constant.rowLabelString) \(rowIndex)"
        } else {
            rowIndexLabel.isHidden = true
        }
        
        if let index = collectionIndex {
            collectionIndexLabel.isHidden = false
            collectionIndexLabel.text = "\(Constant.collectionLabelString) \(index)"
        } else {
            collectionIndexLabel.isHidden = true
        }
    }
}
