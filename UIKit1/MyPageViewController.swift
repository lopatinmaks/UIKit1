import UIKit

final class MyPageViewController: UIPageViewController {
    
    //MARK: Variable
    private let allImages = [UIImage(named: "one"),
                     UIImage(named: "two"),
                     UIImage(named: "three")]
    
    private let presentScreenContent = [
        "Мы рады приветствовать Вас!",
        "Здесь Вы сможете выбрать абсолютно все, что может понадобиться современному человеку, любящему технику Apple",
        "Ну что, начнем?"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self

        if let presentationVC = showViewControllerAtIndex(0) {
            setViewControllers([presentationVC], direction: .forward, animated: true)
        }
    }
    
    //MARK: Method
    private func showViewControllerAtIndex(_ index: Int) -> PresentationViewController? {
        guard index >= 0 else {return nil}
        guard index < presentScreenContent.count else {
            let userDefaults = UserDefaults.standard
            userDefaults.set(true, forKey: "presentationFinish")
            dismiss(animated: true)
            return nil}
        guard let presentationVC = storyboard?.instantiateViewController(withIdentifier: "presentVC") as? PresentationViewController else {return nil}
        if let myImageView = allImages[index] {
            presentationVC.images = myImageView
        }
        
        presentationVC.presentText = presentScreenContent[index]
        presentationVC.currentPage = index
        presentationVC.numberOfPage = presentScreenContent.count
        
        if index == 2 {
            presentationVC.buttonHidden = false
        }
        return presentationVC
    }
}
//MARK: Extension
extension MyPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var pageNumber = (viewController as! PresentationViewController).currentPage
        pageNumber -= 1
        return showViewControllerAtIndex(pageNumber)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var pageNumber = (viewController as! PresentationViewController).currentPage
        pageNumber += 1
        return showViewControllerAtIndex(pageNumber)
    }
}
