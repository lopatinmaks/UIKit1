//
//  OrderPageViewController.swift
//  UIKit1
//
//  Created by Ольга on 01.11.2022.
//

import UIKit

final class OrderPageViewController: UIViewController {
    
    @IBOutlet private var photo: UIImageView!
    var photoSneakers = ""
    
    var selectedProducts = Goods(name: "", price: 0, imageName: "")

    override func viewDidLoad() {
        super.viewDidLoad()

        photo.image = UIImage(named: selectedProducts.imageName)
    }
    

    @IBAction func buyButton(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let finalPage = storyboard.instantiateViewController(withIdentifier: "final") as! FinalPageViewController
        present(finalPage, animated: true)
    }
    
}
