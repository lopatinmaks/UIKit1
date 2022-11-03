//
//  FinalPageViewController.swift
//  UIKit1
//
//  Created by Ольга on 01.11.2022.
//

import UIKit

final class FinalPageViewController: UIViewController {

    @IBOutlet private var orderLabel: UILabel!
    @IBOutlet private var thanksLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    

    @IBAction func makeButton(_ sender: Any) {
        self.thanksLabel.text = ""
        self.alert(title: "Внимание!", message: "Введите смс- код для подтверждения оплаты", style: .alert)
    }
    func alert(title: String, message: String, style: UIAlertController.Style) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "OK", style: .default) { action in
            self.thanksLabel.text! += "Спасибо за покупку"
        }
        alert.addTextField(configurationHandler: nil)
        alert.addAction(action)
        present(alert, animated: true)
        
    }

}
