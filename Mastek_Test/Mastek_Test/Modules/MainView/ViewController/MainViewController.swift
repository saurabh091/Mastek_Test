//
//  MainViewController.swift
//  Mastek_Test
//
//  Created by Saurabh Rana on 19/07/22.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var rowNumber = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register the xib for tableview cell
        let mainCellNib = UINib(nibName: MainTableViewCell.reuseIdentifier, bundle: nil)
        self.tableView.register(mainCellNib, forCellReuseIdentifier: MainTableViewCell.reuseIdentifier)
        let secondaryCellNib = UINib(nibName: SecondaryTableViewCell.reuseIdentifier, bundle: nil)
        self.tableView.register(secondaryCellNib, forCellReuseIdentifier: SecondaryTableViewCell.reuseIdentifier)
        
//        tableView.register(UINib(nibName: "CustomHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: CustomHeader.reuseIdentifier)
        
        let rightButtonItem = UIBarButtonItem.init(
              title: "Update No. of Rows",
              style: .done,
              target: self,
              action: #selector(rightButtonAction)
        )

        self.navigationItem.rightBarButtonItem = rightButtonItem
    }
    
    @objc func rightButtonAction(sender: UIBarButtonItem) {
        debugPrint("**************************    rightButtonAction    **************************")
        
        
        let rowsViewController: RowsViewController = self.storyboard?.instantiateViewController(withIdentifier: "RowsViewController") as! RowsViewController
        
        rowsViewController.onCompletion = { rowString in
            // this will be executed when `someButtonTapped(_:)` will be called
            debugPrint("************* \(rowString)")
        }
        
        let navigationController = UINavigationController(rootViewController: rowsViewController)
        navigationController.modalPresentationStyle = UIModalPresentationStyle.popover
        self.present(navigationController, animated: true, completion: nil)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
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
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 100
//    }
    
    // Category Title
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CustomHeader") as! CustomHeader
////        headerView.customLabel.text = content[section].name  // set this however is appropriate for your app's model
//        headerView.rows = rowNumber/2
//        headerView.delegate = self
//        return headerView
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 4 == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.reuseIdentifier) as? MainTableViewCell {
                // Show SubCategory Title
                //            let subCategoryTitle = colorsArray.objectsArray[indexPath.section].subcategory
                //            cell.subCategoryLabel.text = subCategoryTitle[indexPath.row]
                //
                //            // Pass the data to colletionview inside the tableviewcell
                //            let rowArray = colorsArray.objectsArray[indexPath.section].colors[indexPath.row]
                //            cell.updateCellWith(row: rowArray)
                cell.backgroundColor = .red
                cell.rowNumber = rowNumber
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
        let resultViewController: ResultViewController = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        navigationController?.pushViewController(resultViewController, animated: true)
    }
}

extension MainViewController: CustomHeaderDelegate {
    func customHeader(_ customHeader: CustomHeader, didTapButtonInSection section: Int) {
        print("did tap button", section)
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
