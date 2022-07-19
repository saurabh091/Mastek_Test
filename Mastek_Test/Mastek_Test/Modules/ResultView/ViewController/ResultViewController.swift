//
//  ResultViewController.swift
//  Mastek_Test
//
//  Created by Saurabh Rana on 19/07/22.
//

import UIKit

class ResultViewController: UIViewController {
    
    var backGroundColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let color = backGroundColor {
            view.backgroundColor = color
        } else {
            debugPrint("backGroundColor is nil.")
        }
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
