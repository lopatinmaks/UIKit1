import UIKit
import Foundation

final class CoverViewController: UIViewController {
    
    private var productScrollView = UIScrollView()
    private let systemGrayButton = UIButton()
    private let grayButton = UIButton()
    private let addBasketButton = UIButton()
    var photoOne = UIImage()
    var photoTwo = UIImage()
    
    var myImageOne = ""
    var myImageTwo = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoOne = UIImage(named: myImageOne)!
        photoTwo = UIImage(named: myImageTwo)!
        
        forGrayButton()
        forSystemGreyButton()
        forAddBusket()
        forImages()
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(goOfficialWebSite(sender:)))
        view.addGestureRecognizer(recognizer)
    }
    
    @objc func goOfficialWebSite(sender: UITapGestureRecognizer) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let goWebView = storyboard.instantiateViewController(withIdentifier: "cover") as! WebViewViewController
        present(goWebView, animated: true)
    }
    
    private func forImages() {
        
        productScrollView.backgroundColor = .yellow
        productScrollView = UIScrollView(frame: CGRect(x: 5, y: 250, width: 500, height: 230))
        let scrollViewRect = productScrollView.frame
        productScrollView.isPagingEnabled = true
        productScrollView.contentSize = CGSize(width: scrollViewRect.size.width * 2, height: scrollViewRect.size.height)
        view.addSubview(productScrollView)
        
        var imageViewRect = productScrollView.bounds
        let coverOneImageView = newImageViewWithImageOne(paramImage: photoOne, paramFrame: imageViewRect)
        productScrollView.addSubview(coverOneImageView)
        
        imageViewRect.origin.x += imageViewRect.size.width
        let coverTwoImageView = newImageViewWithImageOne(paramImage: photoTwo, paramFrame: imageViewRect)
        productScrollView.addSubview(coverTwoImageView)
    }
    
    private func newImageViewWithImageOne(paramImage: UIImage, paramFrame: CGRect) -> UIImageView {
        
        let result = UIImageView(frame: paramFrame)
        result.contentMode = .scaleAspectFit
        result.image = UIImage(named: "1")
        return result
    }
    
    private func forSystemGreyButton() {
        systemGrayButton.frame = CGRect(x: 160, y: 530, width: 38, height: 38)
        systemGrayButton.backgroundColor = .systemGray5
        systemGrayButton.layer.cornerRadius = 19
        view.addSubview(systemGrayButton)
    }
    
    private func forGrayButton() {
        grayButton.frame = CGRect(x: 210, y: 530, width: 38, height: 38)
        grayButton.backgroundColor = .gray
        grayButton.layer.cornerRadius = 19
        grayButton.layer.borderWidth = 2
        grayButton.layer.borderColor = UIColor.blue.cgColor
        view.addSubview(grayButton)
    }
    
    private func forAddBusket() {
        addBasketButton.frame = CGRect(x: 20, y: 620, width: 350, height: 40)
        addBasketButton.backgroundColor = .blue
        addBasketButton.layer.cornerRadius = 10
        addBasketButton.setTitle("Добавить в корзину", for: .normal)
        view.addSubview(addBasketButton)
    }
}
