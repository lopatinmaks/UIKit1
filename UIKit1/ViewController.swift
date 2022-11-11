//
//  ViewController.swift
//  UIKit1
//
//  Created by Ольга on 06.10.2022.
//

import UIKit

final class ViewController: UIViewController {
    
//MARK: IBOutlets
    @IBOutlet private var registrationLabel: UILabel!
    @IBOutlet private var nameTF: UITextField!
    @IBOutlet private var surnameTF: UITextField!
    @IBOutlet private var passwordTF: UITextField!
    @IBOutlet private var emailTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTF.delegate = self
        surnameTF.delegate = self
        passwordTF.delegate = self
        emailTF.delegate = self
        
        //MARK: NotificationCentr
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { nc in
            self.view.frame.origin.y = -200
        }
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { nc in
            self.view.frame.origin.y = 0.0
        }
        
    }
    
//MARK: IBOutlet
    @IBAction func enterButton(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(withIdentifier: "vc") as! SecondViewController
        present(secondVC, animated: true)
    }
    
}
//MARK: Extension
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTF {
            surnameTF.becomeFirstResponder()
        } else if textField == surnameTF {
            emailTF.becomeFirstResponder()
        } else if textField == emailTF {
            passwordTF.becomeFirstResponder()
        } else if textField == passwordTF {
            textField.resignFirstResponder()
        }
        return true
    }
}
