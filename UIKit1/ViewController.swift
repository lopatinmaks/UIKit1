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
//    let one = String(self.myImageOne.image)!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myImageOne.image = UIImage(named: "Руки Вверх")
        myImageAvaMax.image = UIImage(named: "Ava Max")
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let playerVC = storyboard.instantiateViewController(withIdentifier: "vc") as! PlayerViewController
//        playerVC.pictureForSong = UIImage(named: "Руки Вверх")
        navigationController?.pushViewController(playerVC, animated: true)
        self.present(playerVC, animated: true)
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "vc" {
//            if let indexPath = self.indexPathForSelectedRow {
//                let playerView = segue.destination as! PlayerViewController
//                playerView.pictureForSong = myImageOne
//            }
//        }
    }

func handeHochButton(_ sender: Any) {
      
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if let vc2 = (storyboard.instantiateViewController(withIdentifier: "vc") as? PlayerViewController) {
            vc2.pictureForSong = "Руки Вверх"
            //self.present(vc2)
        }
    }
    


