//
//  ViewController.swift
//  UIKit1
//
//  Created by Ольга on 06.10.2022.
//

import UIKit

final class RegistrationViewController: UIViewController {

    @IBOutlet private var nameTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func entryButton(_ sender: Any) {
        if nameTextField.text!.isEmpty || passwordTextField.text!.isEmpty {
            let alertController = UIAlertController(title: "Неверные данные", message: "Пожалуйста, введите корректные данные", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default)
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
            }
        }
    }


