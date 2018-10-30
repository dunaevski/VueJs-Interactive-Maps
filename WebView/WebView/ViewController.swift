//
//  ViewController.swift
//  iOS WebView
//
//  Created by Александр on 18/09/2018.
//  Copyright © 2018 Александр. All rights reserved.
//

import UIKit
import WebKit


class ViewController: UIViewController {
//
//    @IBOutlet weak var webView: UIWebView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let myURL = URL(string:"http://localhost")
//        let myRequest = URLRequest(url: myURL!)
//
//        webView.loadRequest(myRequest)
//    }

    var webView: WKWebView!
    
    
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self as? WKUIDelegate
        view = webView
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string:"https://dun.gussi-gussi.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        
        
       
        let blurEffect = UIBlurEffect(style: .prominent) // .extraLight or .dark
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = CGRect(x: 0, y: 0, width: 2500, height: 20)
//        blurEffectView.alpha = 0.1
//        blurEffectView.autoresizingMask = [.flexibleHeight, .flexibleWidth]

        view.addSubview(blurEffectView)
    }

}

