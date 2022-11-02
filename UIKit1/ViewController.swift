//
//  ViewController.swift
//  UIKit1
//
//  Created by Ольга on 06.10.2022.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private var modelsLabel: UILabel!
    @IBOutlet private var pictureImage: UIImageView!
    var segmentControll: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titles = ["Model 1", "Model 2", "Model 3"]
        segmentControll = UISegmentedControl(items: titles)
        
        pictureImage.contentMode = .scaleAspectFill
        
        segmentControll.setTitleTextAttributes([NSAttributedString.Key.font : UIFont(name: "Arial", size: 18)!,
                                                NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: .normal)
        segmentControll.setTitleTextAttributes([NSAttributedString.Key.font : UIFont(name: "Arial", size: 30)!,
                                                NSAttributedString.Key.foregroundColor: UIColor.red], for: .selected)
        
        self.segmentControll.frame = CGRect(x: 15, y: 700, width: 400, height: 30)
        
        segmentControll.addTarget(self, action: #selector(selectedAction(sender:)), for: .valueChanged)
        
        view.addSubview(segmentControll)
    }
    
    
    @IBAction func goForwardButton(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let orderPage = storyboard.instantiateViewController(withIdentifier: "vc") as! OrderPageViewController
        present(orderPage, animated: true)
    }
    
    @objc func selectedAction(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: changeHero(for: 1)
        case 1: changeHero(for: 2)
        case 2: changeHero(for: 3)
        default:
            break
        }
    }
    func changeHero(for index: Int) {
        UIView.animate(withDuration: 0.5, animations: {
            self.pictureImage.alpha = 0
        }) { _ in
            UIView.animate(withDuration: 0.5) {
                self.pictureImage.alpha = 1
                self.pictureImage.image = UIImage(named: "\(index)")
            }
        
        }
    }
}
