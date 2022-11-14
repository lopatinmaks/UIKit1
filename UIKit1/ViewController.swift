import UIKit

final class ViewController: UIViewController {
    
    private var timer = Timer()

    @IBOutlet private var timerLabel: UILabel!
    @IBOutlet private var startButton: UIButton!
    @IBOutlet private var pauseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        startButton.isHidden = false
        pauseButton.isHidden = true
    }

    @IBAction private func startPressedButton(_ sender: Any) {
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerUpdate), userInfo: NSDate(), repeats: true)
        
        startButton.isHidden = true
        pauseButton.isHidden = false
    }
    
    @IBAction private func pausePressedButton(_ sender: Any) {
        
        timer.invalidate()
        
        startButton.isHidden = false
        pauseButton.isHidden = true
    }
    
    @IBAction private func trachButton(_ sender: Any) {
        
        timerLabel.text = "0"
    }
    
    @objc private func timerUpdate() {
        
        let elapsed = -(timer.userInfo as! NSDate).timeIntervalSinceNow
        if elapsed < 60 {
            timerLabel.text = String(format: "%.0f", elapsed)
        }
    }
}
