import UIKit

final class ViewController: UIViewController {
    
    private let bookTV = UITextView()
    private let slider = UISlider()
    private let redButton = UIButton()
    private let blueButton = UIButton()
    private let greenButton = UIButton()
    private let yellowButton = UIButton()
    private let picker = UIPickerView()
    private let mySwitch = UISwitch()
    private let label = UILabel()
    private var segmentedControl = UISegmentedControl()
    private let labelSC = UILabel()
    
    private let fontsDictionary = [
        "Typewriter": [UIFont(name: "AmericanTypewriter", size: 20), UIFont(name: "AmericanTypewriter-Bold", size: 20)],
        "GothicNeo": [UIFont(name: "AppleSDGothicNeo-Regular", size: 20), UIFont(name: "AppleSDGothicNeo-Bold", size: 20)],
        "ArialHebrew": [UIFont(name: "ArialHebrew", size: 20), UIFont(name: "ArialHebrew-Bold", size: 20)],
        "Courier": [UIFont(name: "Courier", size: 20), UIFont(name: "Courier-Bold", size: 20)]]
    private var currentFont = "GothicNeo"
    private var selectedSegment = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        allOutlets()
    }
    
    private func allOutlets() {
        forBook()
        forSlider()
        forRedButton()
        forBlueButton()
        forGreenButton()
        forYellowButton()
        forPicker()
        forSwitch()
        forLabel()
        forSC()
        forLabelSC()
    }

    private func forBook() {
        bookTV.frame = CGRect(x: 10, y: 100, width: 375, height: 460)
        bookTV.text = "1928 год. Веймарская Германия. На окраине большого немецкого города трое молодых людей пытаются, чем могут, зарабатывать себе на жизнь. На улицах беспокойно, появляются первые штурмовики, намекая на возвышение национал-социализма. Бедность и насилие стали обычными спутниками жизни. Для этих троих, дружба является единственной опорой и убежищем от хаоса, царящего в мире. Когда младший из них влюбляется, он приводит молодую женщину в этот круг и их дружбу ждут испытания, которые невозможно было не предвидеть, не предотвратить…  Написанный потрясающе просто, с искренней простотой роман «Три товарища» воспевает величие человеческого духа друзей, которые должны найти в себе силы жить в ситуации, когда сделать это крайне трудно, почти невозможно. Одна из самых лучших историй любви и дружбы в мировой литературе."
        bookTV.layer.cornerRadius = 10
        bookTV.backgroundColor = .lightGray
        bookTV.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        bookTV.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(bookTV)
    }
    
    
    private func forSlider() {
        slider.frame = CGRect(x: 30, y: 570, width: 340, height: 31)
        slider.minimumValue = 10
        slider.maximumValue = 100
        slider.value = 20
        slider.isUserInteractionEnabled = true
        slider.isEnabled = true
        slider.addTarget(self, action: #selector(sizeSlider), for: .valueChanged)
        view.addSubview(slider)
    }
    @objc private func sizeSlider() {
        bookTV.font = bookTV.font?.withSize(CGFloat(slider.value))
    }
    
    
    private func forRedButton() {
        redButton.frame = CGRect(x: 20, y: 630, width: 30, height: 30)
        redButton.backgroundColor = .red
        redButton.layer.cornerRadius = 15
        redButton.addTarget(self, action: #selector(pushRedButton(redButton:)), for: .touchUpInside)
        view.addSubview(redButton)
    }
    @objc private func pushRedButton(redButton: UIButton) {
        bookTV.textColor = redButton.backgroundColor
    }
    
    
    private func forBlueButton() {
        blueButton.frame = CGRect(x: 60, y: 630, width: 30, height: 30)
        blueButton.backgroundColor = .blue
        blueButton.layer.cornerRadius = 15
        blueButton.addTarget(self, action: #selector(pushBlueButton(blueButton:)), for: .touchUpInside)
        view.addSubview(blueButton)
    }
    @objc private func pushBlueButton(blueButton: UIButton) {
        bookTV.textColor = blueButton.backgroundColor
    }
    
    
    private func forGreenButton() {
        greenButton.frame = CGRect(x: 100, y: 630, width: 30, height: 30)
        greenButton.backgroundColor = .green
        greenButton.layer.cornerRadius = 15
        greenButton.addTarget(self, action: #selector(pushGreenButton(greenButton:)), for: .touchUpInside)
        view.addSubview(greenButton)
    }
    @objc private func pushGreenButton(greenButton: UIButton) {
        bookTV.textColor = greenButton.backgroundColor
    }
    
    
    private func forYellowButton() {
        yellowButton.frame = CGRect(x: 140, y: 630, width: 30, height: 30)
        yellowButton.backgroundColor = .yellow
        yellowButton.layer.cornerRadius = 15
        yellowButton.addTarget(self, action: #selector(pushYellowButton(yellowButton:)), for: .touchUpInside)
        view.addSubview(yellowButton)
    }
    @objc private func pushYellowButton(yellowButton: UIButton) {
        bookTV.textColor = yellowButton.backgroundColor
    }
    
    
    private func forPicker() {
        picker.frame = CGRect(x: 230, y: 600, width: 150, height: 100)
        picker.dataSource = self
        picker.delegate = self
        view.addSubview(picker)
    }
    
    private func forSwitch() {
        mySwitch.frame = CGRect(x: 320, y: 700, width: 0, height: 0)
        mySwitch.setOn(false, animated: true)
        view.addSubview(mySwitch)
        
        if mySwitch.isOn {
            bookTV.backgroundColor = .lightGray
            bookTV.textColor = .gray
        } else {
            bookTV.backgroundColor = .white
            bookTV.textColor = .black
        }
        mySwitch.addTarget(self, action: #selector(nightTheme(paramTarget:)), for: .valueChanged)
    }
    @objc private func nightTheme(paramTarget: UISwitch) {
        if paramTarget.isOn {
            bookTV.backgroundColor = .lightGray
            bookTV.textColor = .gray
        } else {
            bookTV.backgroundColor = .white
            bookTV.textColor = .black
        }
    }
    
    private func forLabel() {
        label.frame = CGRect(x: 20, y: 700, width: 200, height: 31)
        label.text = "Включить темную тему?"
        view.addSubview(label)
    }
    private func forSC() {
        let items = ["a", "A"]
        segmentedControl = UISegmentedControl(items: items)
        segmentedControl.frame = CGRect(x: 270, y: 770, width: 100, height: 30)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(textThickness), for: .valueChanged)
        view.addSubview(segmentedControl)
    }
    private func forLabelSC() {
        labelSC.frame = CGRect(x: 20, y: 770, width: 200, height: 31)
        labelSC.text = "Сделать текст жирным?"
        view.addSubview(labelSC)
    }
    
    @objc private func textThickness() {
        selectedSegment = segmentedControl.selectedSegmentIndex
        if segmentedControl.selectedSegmentIndex == 0 {
            changeFontAndSize(name: currentFont, isBold: false)
        } else {
            changeFontAndSize(name: currentFont, isBold: true)
        }
    }
    private func changeFontAndSize(name: String, isBold: Bool) {
        if isBold {
            bookTV.font = (fontsDictionary[name]?.last)!
        } else {
            bookTV.font = (fontsDictionary[name]?.first)!
        }
    }
}

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fontsDictionary.count
    }
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var keys: [String] = []
        for i in fontsDictionary {
            keys.append(i.key)
        }
        return keys[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var keys: [String] = []
        for i in fontsDictionary {
            keys.append(i.key)
        }
        switch keys[row] {
        case let fontName where fontName == "Typewriter": changeFontAndSize(name: fontName, isBold: false)
        case let fontName where fontName == "GothicNeo": changeFontAndSize(name: fontName, isBold: false)
        case let fontName where fontName == "ArialHebrew": changeFontAndSize(name: fontName, isBold: false)
        case let fontName where fontName == "Courier": changeFontAndSize(name: fontName, isBold: false)
        default:
            break
        }
        currentFont = keys[row]
    }
}
