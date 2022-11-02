//
//  SecondViewController.swift
//  UIKit1
//
//  Created by Ольга on 02.11.2022.
//

import UIKit

final class SecondViewController: UIViewController {
//MARK: IBOutlet
    @IBOutlet private var labelText: UILabel!
    
    //MARK: IBActions
    @IBAction func goPickerButton(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let pickerActivityVC = storyboard.instantiateViewController(withIdentifier: "picker") as! PickerActivityViewController
        present(pickerActivityVC, animated: true)
    }
    @IBAction func shareButton(_ sender: Any) {
        
        //Share vk.com
        let items = [NSURL(string: "http://vk.com")]
        let activityVC = UIActivityViewController(activityItems: [labelText.text!, "http://vk.com", items], applicationActivities: nil)
        present(activityVC, animated: true)
    }
}
