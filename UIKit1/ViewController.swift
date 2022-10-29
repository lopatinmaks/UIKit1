//
//  ViewController.swift
//  UIKit1
//
//  Created by Ольга on 06.10.2022.
//

import UIKit
import AVFoundation

final class MyPlayListViewController: UIViewController {

    @IBOutlet private var myImageOne: UIImageView!
    @IBOutlet private var myImageAvaMax: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myImageOne.image = UIImage(named: "Руки Вверх")
        myImageAvaMax.image = UIImage(named: "Ava Max")
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let playerVC = storyboard.instantiateViewController(withIdentifier: "vc") as! PlayerViewController
        present(playerVC, animated: true)
    }
    
    @IBAction func avaMaxButton(_ sender: Any) {
        let storyboardAva = UIStoryboard(name: "Main", bundle: nil)
        if let imageAva = (storyboardAva.instantiateViewController(withIdentifier: "vc") as? PlayerViewController) {
            imageAva.pictureForSong = "Ava Max"
            present(imageAva, animated: true)
        }
    }
    
    @IBAction func handeHochButton(_ sender: Any) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let imageHand = (storyboard.instantiateViewController(withIdentifier: "vc") as? PlayerViewController) {
                imageHand.pictureForSong = "Руки Вверх"
                present(imageHand, animated: true)
            }
        }
}


    


