import UIKit

final class FirstViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        startPresentation()
    }
    
    private func startPresentation() {
        let userDefaults = UserDefaults.standard
        let presentationFinish = userDefaults.bool(forKey: "presentationFinish")
        if presentationFinish == false {
            if let myPageVC = storyboard?.instantiateViewController(withIdentifier: "pageVC") as? MyPageViewController {
                present(myPageVC, animated: true)
            }
        }
    }
    
}
