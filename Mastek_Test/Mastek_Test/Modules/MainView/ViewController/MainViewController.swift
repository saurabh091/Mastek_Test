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
        
        // Register the xib for tableview cell
        self.tableView.register(UINib(nibName: MainTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: MainTableViewCell.reuseIdentifier)
        self.tableView.register(UINib(nibName: SecondaryTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: SecondaryTableViewCell.reuseIdentifier)
        
        let rightButtonItem = UIBarButtonItem.init(title: "Update No. of Rows", style: .done, target: self, action: #selector(rightButtonAction)
        )
        self.navigationItem.rightBarButtonItem = rightButtonItem
    }
    
    @objc func rightButtonAction(sender: UIBarButtonItem) {
        let rowsViewController: RowsViewController = self.storyboard?.instantiateViewController(withIdentifier: "RowsViewController") as! RowsViewController
        
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowNumber
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 4 == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.reuseIdentifier) as? MainTableViewCell {
                cell.rowNumber = rowNumber
                cell.collectionView.reloadData()
                cell.sendRowIndexBack = { [weak self] rowIndex, cellColor in
                    debugPrint(rowIndex)
                    guard let self = self else { return }
                    self.navigateToResultView(rowIndex: indexPath.row, index: rowIndex, color: cellColor)
                }
                return cell
            }
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: SecondaryTableViewCell.reuseIdentifier) as? SecondaryTableViewCell {
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
    
    func navigateToResultView(rowIndex: Int?, index: Int?, color: UIColor) {
        let resultView: ResultViewController = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        resultView.row = rowIndex
        resultView.collectionIndex = index
        resultView.backGroundColor = color
        navigationController?.pushViewController(resultView, animated: true)
    }
}

extension UIColor {
    static var random: UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )
    }
}
