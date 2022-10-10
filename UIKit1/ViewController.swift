//
//  ViewController.swift
//  UIKit1
//
//  Created by Ольга on 06.10.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var phraseLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func actionButton(_ sender: Any) {
        welcome(title: "Привет", message: "Введите слово")
    }
    func welcome(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "Ввод"
            }
        let action = UIAlertAction(title: "ok", style: .default) { action in
            self.phraseLabel.text = BrilliantApplication.brilliantApp.correctPhrase(alertController.textFields?.first?.text ?? "")
        }

                alertController.addAction(action)
                self.present(alertController, animated: true, completion: nil)
            }
            struct BrilliantApplication {
                public static let brilliantApp = BrilliantApplication()

                func correctPhrase(_ phrase : String) -> String {
                    if phrase == "leohl" {
                        return "hello"
                    } else {
                        return "Данные не были получены"
                    }
                }
            }
        }


