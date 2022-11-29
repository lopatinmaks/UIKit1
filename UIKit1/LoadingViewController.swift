//
//  LoadingViewController.swift
//  UIKit1
//
//  Created by Ольга on 29.11.2022.
//

import UIKit

class LoadingViewController: UIViewController {

    @IBOutlet weak var jdunImageView: UIImageView!
    @IBOutlet weak var loadingProgressView: UIProgressView!
    
    var myTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createProgressView(loadingProgressView)
        createJdun(jdunImageView)
        createTimer()
    }
    
    private func createTimer() {
        myTimer = Timer.scheduledTimer(timeInterval: 1,
                                       target: self,
                                       selector: #selector(upgradeProgressView),
                                       userInfo: nil,
                                       repeats: true)
    }
    
    @objc func upgradeProgressView() {
        if loadingProgressView.progress != 1.0 {
            loadingProgressView.progress += 0.1/1.0
        } else if loadingProgressView.progress == 1.0 {
            UIView.animate(withDuration: 0.7) {
                self.jdunImageView.alpha = 1
                self.myTimer.invalidate()
            }
            if loadingProgressView.progress == 1.0 {
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let forYouVC = storyboard.instantiateViewController(withIdentifier: "forYouVC") as! ForYouViewController
                present(forYouVC, animated: true)
            }
        }
    }
    
    private func createProgressView(_ progressView: UIProgressView) {
        progressView.progressViewStyle = .bar
        progressView.setProgress(0.0, animated: false)
        progressView.progressTintColor = .green
        progressView.trackTintColor = .gray
    }
    
    private func createJdun(_ imageView: UIImageView) {
        imageView.alpha = 0.2
    }
   

}
