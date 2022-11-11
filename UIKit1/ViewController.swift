import UIKit

final class ViewController: UIViewController {
    
    //MARK: Private properties
    private let label = UILabel()
    private let slider = UISlider()
    private let pickerColor = UIPickerView()
    private let pickerLines = UIPickerView()
    private let textColorLabel = UILabel()
    private let textLinesLabel = UILabel()
    private var labelColor: UIColor = .black
    
    private let colorsArray: [UIColor] = [.red, .green, .yellow]
    private let numLines: [Int] = [0, 1, 2]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allOutlets()
        updateLabel()
    }
    //MARK: Visual components
    private func forLabel() {
        label.frame = CGRect(x: 30, y: 200, width: 350, height: 200)
        label.text = ""
        label.backgroundColor = .lightGray
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.numberOfLines = 0
        label.textAlignment = .center
        view.addSubview(label)
    }
    
    private func forSlider() {
        slider.frame = CGRect(x: 30, y: 450, width: 350, height: 23)
        slider.minimumValue = 10
        slider.maximumValue = 100
        slider.isUserInteractionEnabled = true
        slider.isEnabled = true
        slider.addTarget(self, action: #selector(sizeSlider), for: .valueChanged)
        view.addSubview(slider)
    }
    
    private func forPickerColors() {
        pickerColor.frame = CGRect(x: 250, y: 550, width: 150, height: 100)
        pickerColor.dataSource = self
        pickerColor.delegate = self
        pickerColor.tag = 0
        view.addSubview(pickerColor)
    }
    
    private func forPickerLines() {
        pickerLines.frame = CGRect(x: 250, y: 650, width: 150, height: 100)
        pickerLines.dataSource = self
        pickerLines.delegate = self
        pickerLines.tag = 1
        view.addSubview(pickerLines)
    }
    
    private func forTextColorLabel() {
        textColorLabel.frame = CGRect(x: 30, y: 574, width: 200, height: 50)
        textColorLabel.text = "Выберите цвет текста"
        view.addSubview(textColorLabel)
    }
    
    private func forTextLinesLabel() {
        textLinesLabel.frame = CGRect(x: 30, y: 674, width: 200, height: 50)
        textLinesLabel.text = "Выберите количество строк текста"
        textLinesLabel.numberOfLines = 0
        view.addSubview(textLinesLabel)
    }
    //MARK: Private Methods
    private func allOutlets() {
        forLabel()
        forSlider()
        forPickerLines()
        forPickerColors()
        forTextColorLabel()
        forTextLinesLabel()
    }
    
    //MARK: IBAction
    @IBAction func addItem(_ sender: Any) {
        labelText(title: "Внимание", message: "Введите текст", style: .alert)
        label.text = ""
    }
    
    //MARK: Methods & Extensions
    func updateLabel() {
        label.textColor = labelColor
    }
    
    @objc func sizeSlider() {
        label.font = label.font.withSize(CGFloat(slider.value))
    }
}

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 0:
            return colorsArray.count
        case 1:
            return numLines.count
        default:
            return 0
        }
    }
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 0:
            return colorTextInLabel(color: colorsArray[row])
        case 1:
            return String(numberLinesOfText(grade: numLines[row]))
        default:
            return nil
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if  pickerView.tag == 1 {
            label.numberOfLines = numLines[row]
        } else if pickerView.tag == 0 {
            label.textColor = colorsArray[row]
        }
    }
}

extension ViewController {
    func labelText(title: String, message: String, style: UIAlertController.Style) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "OK", style: .default) {action in
            guard let text = alert.textFields?.first else {return}
            self.label.text = (text.text)!
        }
        alert.addTextField()
        alert.addAction(action)
        present(alert, animated: true)
    }
}

func colorTextInLabel(color: UIColor) -> String {
    switch color {
    case .red:
        return "Красный"
    case .green:
        return "Зеленый"
    case .yellow:
        return "Желтый"
    default:
        return ""
    }
}

func numberLinesOfText(grade: Int) -> Int {
    switch grade {
    case 0:
        return 0
    case 1:
        return 1
    case 2:
        return 2
    default:
        return 0
    }
}
