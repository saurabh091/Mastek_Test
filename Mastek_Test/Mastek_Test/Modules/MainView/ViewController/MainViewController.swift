//
//  MainViewController.swift
//  Mastek_Test
//
//  Created by Saurabh Rana on 19/07/22.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var rowNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        // Register the xib for tableview cell
        self.tableView.register(UINib(nibName: Constant.mainTableViewCellIdentifier, bundle: nil), forCellReuseIdentifier: Constant.mainTableViewCellIdentifier)
        self.tableView.register(UINib(nibName: Constant.secondaryCellIdentifier, bundle: nil), forCellReuseIdentifier: Constant.secondaryCellIdentifier)
        
        // setup right bar button
        let rightButtonItem = UIBarButtonItem.init(title: Constant.rightBarButtonTitle, style: .done, target: self, action: #selector(rightButtonAction)
        )
        self.navigationItem.rightBarButtonItem = rightButtonItem
    }
    
    /// Function on click of  Right bar button
    /// - Parameter sender: Instance of UIBarButtonItem
    @objc func rightButtonAction(sender: UIBarButtonItem) {
        let rowsViewController: RowsViewController = self.storyboard?.instantiateViewController(withIdentifier: Constant.rowsViewIdentifier) as! RowsViewController
        
        rowsViewController.sendDataBack = { [weak self] rowString in
            guard let self = self else { return }
            self.rowNumber = Int(rowString) ?? 0
            self.tableView.reloadData()
        }
        
        let navigationController = UINavigationController(rootViewController: rowsViewController)
        navigationController.modalPresentationStyle = UIModalPresentationStyle.popover
        self.present(navigationController, animated: true, completion: nil)
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return Constant.tableViewSection
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowNumber
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(Constant.rowHeight)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % Constant.tableViewCollectionRow == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: Constant.mainTableViewCellIdentifier) as? MainTableViewCell {
                cell.rowNumber = rowNumber
                cell.collectionView.reloadData()
                cell.sendRowIndexBack = { [weak self] rowIndex, cellColor in
                    guard let self = self else { return }
                    self.navigateToResultView(rowIndex: indexPath.row, index: rowIndex, color: cellColor)
                }
                return cell
            }
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: Constant.secondaryCellIdentifier) as? SecondaryTableViewCell {
                cell.backView.backgroundColor = .random
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? SecondaryTableViewCell else {
            return
        }
        navigateToResultView(rowIndex: indexPath.row, index: nil, color: cell.backView.backgroundColor ?? .white)
    }
    
    /// Function to navigate the Result View
    /// - Parameters:
    ///   - rowIndex: TableView Row IndexPath row
    ///   - index: Collection View IndexPath row
    ///   - color: UiColor
    func navigateToResultView(rowIndex: Int?, index: Int?, color: UIColor) {
        let resultView: ResultViewController = self.storyboard?.instantiateViewController(withIdentifier: Constant.resultViewIdentifier) as! ResultViewController
        resultView.row = rowIndex
        resultView.collectionIndex = index
        resultView.backGroundColor = color
        navigationController?.pushViewController(resultView, animated: true)
    }
}
