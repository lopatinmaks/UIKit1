import UIKit

final class ForYouViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var myProgressView: UIProgressView!
    @IBOutlet weak var airPodsImageView: UIImageView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var myView: UIView!
    
    //MARK: Variable
    private let myButton = UIButton()
    private let mySpot = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        allMethods()
    }
    //MARK: UI
    private func forButton() {
        
        myButton.frame = CGRect(x: 40, y: 530, width: 30, height: 30)
        myButton.layer.cornerRadius = 5
        myButton.layer.borderColor = UIColor.red.cgColor
        myButton.layer.borderWidth = 2
        myButton.backgroundColor = .white
        view.addSubview(myButton)
    }
    
    private func forSpot() {
        
        mySpot.frame = CGRect(x: 62, y: 527, width: 10, height: 10)
        mySpot.layer.cornerRadius = 5
        mySpot.backgroundColor = .red
        view.addSubview(mySpot)
    }
    
    private func forAvatar() {
        
        avatarImageView.layer.cornerRadius = 34
    }
    
    private func forView() {
        
        myView.backgroundColor = .white
        myView.layer.cornerRadius = 20
        myView.layer.shadowColor = UIColor.lightGray.cgColor
        myView.layer.shadowOffset = CGSize(width: -1.0, height: 1.0)
        myView.layer.shadowRadius = 2.0
        myView.layer.shadowOpacity = 1.0
    }
    
    private func forAirPods() {
        
        airPodsImageView.layer.cornerRadius = 34
    }
    
    private func allMethods() {
        
        forButton()
        forSpot()
        forAvatar()
        forView()
        forAirPods()
    }
}
