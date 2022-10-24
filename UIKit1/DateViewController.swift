//
//  DateViewController.swift
//  UIKit1
//
//  Created by Ольга on 24.10.2022.
//

import UIKit

class DateViewController: UIViewController {

    @IBOutlet var fotoLabel: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var instaLabel: UILabel!
    @IBOutlet weak var instaTextField: UITextField!
    
    let datePicker = UIDatePicker()
    let agePicker = UIPickerView()
    let genderPicker = UIPickerView()
    let genderArray = ["Парень", "Девушка"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        datePicker.preferredDatePickerStyle = .wheels
        datePicker.locale = .init(identifier: "Russian")
        
        ageTextField.inputView = agePicker
        genderTextField.inputView = genderPicker
        
        createPicker()
        createDatePicker()
        
        agePicker.dataSource = self
        agePicker.delegate = self
        
        genderPicker.dataSource = self
        genderPicker.delegate = self
        
        agePicker.tag = 0
        genderPicker.tag = 1
        
        
    }
    
    func createDatePicker() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneDateAction))
        toolbar.setItems([doneButton], animated: true)
        
        dateTextField.inputAccessoryView = toolbar
        dateTextField.inputView = datePicker
        datePicker.datePickerMode = .date
    }
    
    func createPicker() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneAction))
        toolbar.setItems([doneButton], animated: true)
        
        ageTextField.inputAccessoryView = toolbar
        genderTextField.inputAccessoryView = toolbar
    }
    
    @objc func doneDateAction() {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        formatter.locale = .init(identifier: "Russian")
        
        dateTextField.text = formatter.string(from: datePicker.date)
        
        view.endEditing(true)
    }
    
    @objc func doneAction() {
        view.endEditing(true)
    }
    
    @IBAction func abolitionButton(_ sender: UIButton) {
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        
    }
    
    @IBAction func instaAction(_ sender: Any, forEvent event: UIEvent) {
        
        self.alert(title: "Введите username Instagram", message: "", style: .alert)
    }
    
    func alert(title: String, message: String, style: UIAlertController.Style) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "Ok", style: .default) { (action) in
            let text = alert.textFields?.first
//            self.instaTextField.text! = (text?.text!)!
        }
        let cancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alert.addTextField(configurationHandler: nil)
        alert.textFields![0].placeholder = "Например yashalava2019"
        alert.addAction(cancel)
        alert.addAction(action)
        present(alert, animated: true)
    }
}
extension DateViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 0:
            return 100
        case 1:
            return genderArray.count
        default:
            return 1
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 0:
            return String(row)
        case 1:
            return genderArray[row]
        default:
            return ""
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 0:
            ageTextField.text = String(row)
        case 1:
            genderTextField.text = genderArray[row]
        default:
            break
        }
    }
}
