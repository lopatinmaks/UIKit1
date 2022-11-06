//
//  PaymentViewController.swift
//  UIKit1
//
//  Created by Ольга on 03.11.2022.
//

import UIKit

final class PaymentViewController: UIViewController {

    let paymentButton = UIButton()
    //Контенеры, которые принимают
    var additivesOne = ""
    var additivesTwo = ""
    var additivesThree = ""
    var additivesFour = ""
    var additivesFive = ""
    
    //MARK: IBOutlet
    @IBOutlet private var oneLabel: UILabel!
    @IBOutlet private var twoLabel: UILabel!
    @IBOutlet private var threeLabel: UILabel!
    @IBOutlet private var fiveLabel: UILabel!
    @IBOutlet private var fourLabel: UILabel!
    @IBOutlet private var cardSwitch: UISwitch!
    @IBOutlet private var cashSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardSwitch.isOn = true
        cashSwitch.isOn = false
        
        oneLabel.text = additivesOne
        twoLabel.text = additivesTwo
        threeLabel.text = additivesThree
        fourLabel.text = additivesFour
        fiveLabel.text = additivesFive

        paymentButton.frame = CGRect(x: 60, y: 750, width: 300, height: 60)
        paymentButton.backgroundColor = .black
        paymentButton.layer.cornerRadius = 20
        paymentButton.setTitle("Pay", for: .normal)
        paymentButton.addTarget(self, action: #selector(payCheck), for: .touchUpInside)
        
        view.addSubview(paymentButton)
    }
    @objc func payCheck() {
        forAlert()
    }
}
extension PaymentViewController {
    func forAlert() {
        let alert = UIAlertController(title: "Заказ оплачен!", message: "Ваш заказ доставят в течении 15 минут! Приятного аппетита", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(action
        )
        present(alert, animated: true)
    }
}
