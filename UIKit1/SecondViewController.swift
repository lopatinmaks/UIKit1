//
//  SecondViewController.swift
//  UIKit1
//
//  Created by Ольга on 11.11.2022.
//

import UIKit

final class SecondViewController: UIViewController {
    
    private let mySwitch = UISwitch()

    override func viewDidLoad() {
        super.viewDidLoad()

        forSwitch()
    }
    
    private func forSwitch() {
        mySwitch.center = view.center
        mySwitch.setOn(false, animated: true)
        view.addSubview(mySwitch)
        
        if mySwitch.isOn {
            view.backgroundColor = .blue
        } else {
            view.backgroundColor = .red
        }
        mySwitch.addTarget(self, action: #selector(forSwitch(paramTarget:)), for: .valueChanged)
    }
    
    @objc func forSwitch(paramTarget: UISwitch) {
        if paramTarget.isOn {
            view.backgroundColor = .blue
        } else {
            view.backgroundColor = .red
        }
    }
}
