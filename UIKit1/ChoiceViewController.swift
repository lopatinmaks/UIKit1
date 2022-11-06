//
//  ChoiceViewController.swift
//  UIKit1
//
//  Created by Ольга on 03.11.2022.
//

import UIKit

final class ChoiceViewController: UIViewController {

    //MARK: IBOutlet
    @IBOutlet private var pepperoni: UIImageView!
    @IBOutlet private var fourChees: UIImageView!
    @IBOutlet private var fourCheesLabel: UILabel!
    @IBOutlet private var pepperoniLabel: UILabel!
    
    //Что передаю на след вью
    let photo = UIImageView()
    let namePep = "Пепперони"
    let nameChees = "Четыре сыра"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pepperoniLabel.text = namePep
        fourCheesLabel.text = nameChees
    }
    
    //MARK: IBAction с передачей
    @IBAction func pepperoniButton(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let goPep = storyboard.instantiateViewController(withIdentifier: "vc") as? PizzaViewController else {return}
        goPep.picture = "1"
        goPep.name = namePep
        
        present(goPep, animated: true)
        
    }
    
    @IBAction func fourCheesButton(_ sender: Any) {
        let storyboardTwo: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let goChees = storyboardTwo.instantiateViewController(withIdentifier: "vc") as? PizzaViewController else {return}
        goChees.picture = "2"
        goChees.name = nameChees
        
        present(goChees, animated: true)
    }
    

}
