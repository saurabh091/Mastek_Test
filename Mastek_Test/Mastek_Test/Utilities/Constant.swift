//
//  Constant.swift
//  Mastek_Test
//
//  Created by Saurabh Rana on 20/07/22.
//

import Foundation
import CoreGraphics

struct Constant {
    // ViewController Identifiers
    static let rowsViewIdentifier = "RowsViewController"
    static let resultViewIdentifier = "ResultViewController"

    // Cell Identifiers
    static let secondaryCellIdentifier = "SecondaryTableViewCell"
    static let mainTableViewCellIdentifier = "MainTableViewCell"
    static let mainCVCellIdentifier = "MainCollectionViewCell"
    
    // MainViewController Strings
    static let rightBarButtonTitle = "Update No. of Rows"
    
    // ResultViewController Strings
    static let rowLabelString = "Row Index :"
    static let collectionLabelString = "Collection Index :"
    static let backGroundColorError = "backGroundColor is nil."
    static let blankSpace = ""
    
    static let rowHeight = 100
    static let tableViewCollectionRow = 4
    static let sideSpace: CGFloat = 40
    static let cellHeight: CGFloat = 80
    static let minimumSpacing: CGFloat = 0
    static let cellCount: CGFloat = 5
    static let tableViewSection = 1
}
