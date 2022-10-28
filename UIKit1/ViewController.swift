//
//  ViewController.swift
//  UIKit1
//
//  Created by Ольга on 06.10.2022.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private var textField: UITextField!

    @IBAction func button(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(identifier: "vc") as? WelcomeViewController {
            vc.text = textField.text!
            present(vc, animated: true)
        }
    }
}

