import UIKit

final class ViewController: UIViewController, UIScrollViewDelegate {
    
    private var myScrollView = UIScrollView()
    
    private let coverMacImage = UIImage(named: "1")
    private let iWatchImage = UIImage(named: "watch")
    private let iPhoneImage = UIImage(named: "iPhone")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        forMethods()
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapCover(sender:)))
        view.addGestureRecognizer(tapRecognizer)
    }
    
    private func forMyScrollView() {
        
        myScrollView = UIScrollView(frame: CGRect(x: 5, y: 250, width: 500, height: 230))
        let scrollViewRect = myScrollView.frame
        myScrollView.isPagingEnabled = false
        myScrollView.contentSize = CGSize(width: scrollViewRect.size.width * 3, height: scrollViewRect.size.height)
        view.addSubview(myScrollView)
    }
    
    private func forImages() {
        
        var imageViewRect = myScrollView.bounds
        let coverMacImageView = newImageViewWithImage(paramImage: coverMacImage!, paramFrame: imageViewRect)
        
        myScrollView.addSubview(coverMacImageView)
        
        imageViewRect.origin.x += imageViewRect.size.width
        let iWatchImageView = newImageViewWithImage(paramImage: iWatchImage!, paramFrame: imageViewRect)
        myScrollView.addSubview(iWatchImageView)
        
        imageViewRect.origin.x += imageViewRect.size.width
        let iPhoneImageView = newImageViewWithImage(paramImage: iPhoneImage!, paramFrame: imageViewRect)
        myScrollView.addSubview(iPhoneImageView)
    }
    
    @objc private func tapCover(sender: UITapGestureRecognizer) {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let coverVC = storyboard.instantiateViewController(withIdentifier: "vc") as! CoverViewController
        coverVC.myImageOne = "1"
        coverVC.myImageTwo = "2"
        present(coverVC, animated: true)
    }
  
    private func newImageViewWithImage(paramImage: UIImage, paramFrame: CGRect) -> UIImageView {
        
        let result = UIImageView(frame: paramFrame)
        result.contentMode = .scaleAspectFit
        result.image = paramImage
        return result
    }
    
    private func forMethods() {
        
        forMyScrollView()
        forImages()
    }
}
