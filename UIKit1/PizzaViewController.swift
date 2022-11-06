//
//  PizzaViewController.swift
//  UIKit1
//
//  Created by Ольга on 03.11.2022.
//

import UIKit

final class PizzaViewController: UIViewController {

    //MARK: IBOutlet
    @IBOutlet private var namePizza: UILabel!
    @IBOutlet private var photoPizza: UIImageView!
    @IBOutlet private var mozarellaLabel: UILabel!
    @IBOutlet private var hamLabel: UILabel!
    @IBOutlet private var mushroomsLabel: UILabel!
    @IBOutlet private var olivesLabel: UILabel!
    @IBOutlet private var one: UISwitch!
    @IBOutlet private var two: UISwitch!
    @IBOutlet private var three: UISwitch!
    @IBOutlet private var four: UISwitch!
    //Контейнеры, которые принимают с предыдущего вью
    var picture = ""
    var name = ""
    
    //Что передаю на след вью
    var mozarella = "Моцарелла"
    var ham = "Ветчина"
    var mushroom = "Грибы"
    var olives = "Маслины"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        photoPizza.image = UIImage(named: picture)
        namePizza.text = name
        one.isOn = true
        two.isOn = true
        three.isOn = true
        four.isOn = true
        
        mozarellaLabel.text = mozarella
        hamLabel.text = ham
        mushroomsLabel.text = mushroom
        olivesLabel.text = olives
    }
    
//MARK: IBAction и передача на след вью
    @IBAction func goCheckButton(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let goLastVC = storyboard.instantiateViewController(withIdentifier: "lastVC") as? PaymentViewController else {return}
        goLastVC.additivesOne = name
        
        if one.isOn {
            goLastVC.additivesTwo = mozarella
        } else {
            print("No additives")
        }
        if two.isOn {
            goLastVC.additivesThree = ham
        } else {
            print("No additives")
        }
        if three.isOn {
            goLastVC.additivesFour = mushroom
        } else {
            print("No additives")
        }
        if four.isOn {
            goLastVC.additivesFive = olives
        } else {
            print("No additives")
        }
        
        present(goLastVC, animated: true)
    }
}
