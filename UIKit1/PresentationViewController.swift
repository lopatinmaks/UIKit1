import UIKit

final class PresentationViewController: UIViewController {
    
    //MARK: Outlet
    @IBOutlet private var myImageView: UIImageView!
    @IBOutlet private var textLabel: UILabel!
    @IBOutlet private var myPageControl: UIPageControl!
    @IBOutlet private var myButton: UIButton!
    
    //MARK: Variable
    var images = UIImage()
    var presentText = ""
    var currentPage = 0
    var numberOfPage = 0
    var buttonHidden = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myImageView.image = images
        textLabel.text = presentText
        myPageControl.numberOfPages = numberOfPage
        myPageControl.currentPage = currentPage
        
        myButton.layer.cornerRadius = 20
        myButton.isHidden = buttonHidden
    }

    //MARK: Action
    @IBAction func goButton(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let tabBarVC = storyboard.instantiateViewController(withIdentifier: "start")
        present(tabBarVC, animated: true)
    }
}
