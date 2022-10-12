//
//  ViewController.swift
//  UIKit1
//
//  Created by Ольга on 06.10.2022.
//

import UIKit

//1.Написать свое мини приложение на первом экране две кнопки "сложение" и "угадай число"
//2. При попадании на этот экран запрашивать ФИО через алер и отображать в UILabel
//3. По нажатию на "сложение" открывать Алерт который просит ввести число 1 и число 2 и кнопка посчитать выводит результат в любом виде юзеру
//4. При нажатии на кнопку "угадай число" нужно придумать игру где нужно угадать число
//5. Создать второе приложение MVC у которого на экране будет кнопка "начать" которая вызывает Алерт с сообщением "введите слово"
//6. Нужно ввести "leohl" в Алерт нажимаете "ок" отдаете контролеру а контролер отдаст это в модель которая из буквосочетания "leohl" вернет слово "hello" контролеру а контролер отдаст это лейблу и отобразит это на экране

final class AmountCountingViewController: UIViewController {

    @IBOutlet private var hiLabel: UILabel!
    @IBOutlet private var additionalLabel: UILabel!
    @IBOutlet private var guessLabel: UILabel!

    override func viewDidAppear(_ animated: Bool) {
        welcome(title: "Здравствуйте", message: "Введите ваши ФИО", style: .alert)
    }

    func fullname(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "ok", style: .default) {action in
            let one = alertController.textFields?.first
            let two = alertController.textFields?.last
            let summa = ((Int(one?.text ?? "0") ?? 0) + Int(two?.text ?? "0")! )
            self.additionalLabel.text = String(summa)
        }
        alertController.addTextField { textField in
        }
        alertController.addTextField { textField in
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }

    func welcome(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "ok", style: .default) { action in
            let text = alertController.textFields?.first
            self.hiLabel?.text! += text?.text ?? ""
        }
        alertController.addTextField { textField in
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }

    var click = 0
    var number = ""

    func guessGame(title: String, message: String, style: UIAlertController.Style) {
            let alertControllerGame = UIAlertController(title: title, message: message, preferredStyle: style)
            let actionGame = UIAlertAction(title: "ok", style: .default)
        alertControllerGame.addAction(actionGame)
        self.present(alertControllerGame, animated: true, completion: nil)
    }

    func alertGuessGame(title: String, message: String, style: UIAlertController.Style) {
        let alertControllerGame = UIAlertController(title: title, message: message, preferredStyle: style)
        let actionGame = UIAlertAction(title: "ok", style: .default) { _ in
            let text = alertControllerGame.textFields?.first

            self.number = String((Int(text?.text ?? "0") ?? 0) / 6)
            self.guessLabel?.text! = self.number
        }
        alertControllerGame.addTextField { textField in
        }
        alertControllerGame.addAction(actionGame)
        self.present(alertControllerGame, animated: true, completion: nil)
    }

    @IBAction func additionButton(_sender: Any) {
        fullname(title: "Привет", message: "Введите число", style: .alert)
    }


    @IBAction func guessButton(_sender: Any) {
        click += 1
        if self.click == 1 {
            guessGame(title: "Начинаем!", message: "ВВедите число от 1 до 9", style: .alert)
    } else if self.click == 2 {
        guessGame(title: "Начинаем!", message: "У вас 5 попыток", style: .alert)
    } else if self.click == 3 {
        guessGame(title: "Начинаем!", message: "Последняя попытка", style: .alert)
    } else if self.click == 4 {
        guessGame(title: "Начинаем!", message: "Посмотрите деление на 6", style: .alert)
    } else if self.click == 5 {
        guessGame(title: "Начинаем!", message: "Ваш номер \(number)", style: .alert)
        click = 0
    }

}
}
