//
//  RowsViewController.swift
//  Mastek_Test
//
//  Created by Saurabh Rana on 19/07/22.
//

import UIKit

class RowsViewController: UIViewController {
    
    @IBOutlet weak var rowsTextField: UITextField!
    var onCompletion: ((_ rowNumber :String) ->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @IBAction func doneAction(_ sender: Any) {
        onCompletion?(rowsTextField.text ?? "")
        navigationController?.dismiss(animated: true)
    }

    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        rowsTextField.resignFirstResponder()
    }
}
