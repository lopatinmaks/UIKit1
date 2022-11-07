//
//  TimerViewController.swift
//  UIKit1
//
//  Created by Ольга on 07.11.2022.
//

import UIKit

final class TimerViewController: UIViewController {

    private let picker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        picker.frame = CGRect(x: 50, y: 150, width: 300, height: 50)
        picker.datePickerMode = .countDownTimer
        picker.backgroundColor = .lightGray
        
        view.addSubview(picker)
        
        picker.countDownDuration = 2 * 60
        
    }
    

  

}
