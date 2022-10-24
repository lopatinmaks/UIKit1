//
//  ViewController.swift
//  UIKit1
//
//  Created by Ольга on 06.10.2022.
//

import UIKit
import AVFoundation

final class StartPageViewController: UIViewController {

    

    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet weak var signInLabel: UILabel!
    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var switchId: UISwitch!
    @IBOutlet weak var faceIdLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func entryButton(_ sender: UIButton) {
    }
}

