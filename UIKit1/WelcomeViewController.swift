//
//  WelcomeViewController.swift
//  UIKit1
//
//  Created by Ольга on 28.10.2022.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    @IBOutlet private var label: UILabel!
    var text = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = text
        
    }
    

   

}
