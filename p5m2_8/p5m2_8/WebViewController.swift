//
//  WebViewController.swift
//  p5m2_8
//
//  Created by Amina TomasMart on 08.02.2024.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    private lazy var webView: WKWebView = {
        $0.frame = view.bounds
        $0.navigationDelegate = self
        return $0
    }(WKWebView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        if let url = URL(string: "https://error-nil.namari.ru") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
}

extension WebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("Test")
    }
}
