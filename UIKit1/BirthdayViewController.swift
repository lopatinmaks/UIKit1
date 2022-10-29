//
//  BirthdayViewController.swift
//  UIKit1
//
//  Created by Ольга on 15.10.2022.
//

import UIKit

class BirthdayViewController: UIViewController {

    let mySwitch = UISwitch()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.mySwitch.frame = CGRect(x: 100, y: 100, width: 0, height: 0)
        self.view.addSubview(mySwitch)
    }
    

    
}
