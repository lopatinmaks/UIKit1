//
//  AlarmViewController.swift
//  UIKit1
//
//  Created by Ольга on 07.11.2022.
//

import UIKit

final class AlarmViewController: UIViewController {
    
    //MARK: IBOutlet
    @IBOutlet private var oneSwitch: UISwitch!
    @IBOutlet private var twoSwitch: UISwitch!
    @IBOutlet private var threeSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        oneSwitch.isOn = false
        twoSwitch.isOn = false
        threeSwitch.isOn = false
    }
    

    

}
