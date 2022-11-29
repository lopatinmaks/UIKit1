//
//  WebViewViewController.swift
//  UIKit1
//
//  Created by Ольга on 25.11.2022.
//

import UIKit

final class WebViewViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet private var myWebView: UIWebView!
    @IBOutlet private var goBackItem: UIBarButtonItem!
    @IBOutlet private var goForwardItem: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myWebView.delegate = self

        if let myUrl = URL(string: "https://www.apple.com/shop/product/HMVX2ZM/A/incase-13-compact-sleeve-in-flight-nylon-for-macbook-air-and-macbook-pro?fnode=3b7eaff2919d566bce92371bf0e66d11ee19f14b8a99cd855483c04c49c23db95e580157e9b22c772cbe40b664069489ca9d7b6d743231a275ee8109afbce8a6711ee33fd77208ec62f1f40b60efad811ff0208e559c651a8787f2f79bc81916") {
            let request = URLRequest(url: myUrl)
            myWebView.loadRequest(request)
        }
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        
        self.goBackItem.isEnabled = false
        self.goForwardItem.isEnabled = false
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
        if myWebView.canGoBack {
            self.goBackItem.isEnabled = true
        } else if myWebView.canGoForward {
            self.goForwardItem.isEnabled = true
        }
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebView.NavigationType) -> Bool {
        
        return true
    }
    
    @IBAction private func goBackAction(_ sender: Any) {
        
        if myWebView.canGoBack {
            myWebView.goBack()
        }
    }
    
    @IBAction private func goForwardAction(_ sender: Any) {
        
        if myWebView.canGoForward {
            myWebView.goForward()
        }
    }
    
    @IBAction private func refrechAction(_ sender: Any) {
        
        myWebView.reload()
    }
}
