//
//  PickerActivityViewController.swift
//  UIKit1
//
//  Created by Ольга on 02.11.2022.
//

import UIKit

class PickerActivityViewController: UIViewController {
    //MARK: IBOutlet
    @IBOutlet private var textField: UITextField!
    //MARK: Constants
    let data = ["One", "Two", "Share"]
    lazy var activityForPicker = UIActivityViewController(activityItems: data, applicationActivities: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createPicker()
    }
    //MARK: Method for UIPickerView
    func createPicker() {
        let picker = UIPickerView()
        picker.delegate = self
        textField.inputView = picker
    }
}
//MARK: Extension and Method for UIPickerView
extension PickerActivityViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
}

extension PickerActivityViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        textField.text = data[row]
    }
}

