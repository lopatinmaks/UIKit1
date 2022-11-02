//
//  ViewController.swift
//  UIKit1
//
//  Created by Ольга on 06.10.2022.
//

import UIKit

final class ViewController: UIViewController, UITextFieldDelegate {
    //MARK: Constants
    var buttonShare = UIButton()
    var textField = UITextField()
    var activityVC: UIActivityViewController? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.createTextField()
        self.createButton()
    }
    //MARK: IBAction
    @IBAction func goButton(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(withIdentifier: "vc") as! SecondViewController
        present(secondVC, animated: true)
    }
    
//MARK: Methods
    func createTextField() {
        self.textField.frame = CGRect(x: 0, y: 0, width: 280, height: 30)
        self.textField.center = self.view.center
        self.textField.borderStyle = UITextField.BorderStyle.roundedRect
        self.textField.placeholder = "Enter text to share"
        self.textField.delegate = self
        self.view.addSubview(self.textField)
    }
    func createButton() {
        self.buttonShare = UIButton(type: .roundedRect)
        self.buttonShare.frame = CGRect(x: 50, y: 350, width: 280, height: 44)
        self.buttonShare.setTitle("Расшарить", for: .normal)
        self.buttonShare.addTarget(self, action: #selector(handleShare(paramSender:)), for: .touchUpInside)
        self.view.addSubview(self.buttonShare)
    }
    //MARK: Method for Button
    @objc func handleShare(paramSender: Any) {
        let text = self.textField.text
        
        if text?.count == 0 {
            let message = "Сначала введите текст, потом нажмите кнопку"
            let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel)
            alert.addAction(action)
            present(alert, animated: true)
        }
        self.activityVC = UIActivityViewController(activityItems: [self.textField.text ?? "nil"], applicationActivities: nil)
        present(self.activityVC!, animated: true)
    }
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.textField.resignFirstResponder()
        
        return true
    }
}

