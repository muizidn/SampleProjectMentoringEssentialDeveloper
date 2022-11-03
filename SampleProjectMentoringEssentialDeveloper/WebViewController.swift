//
//  WebViewController.swift
//  SampleProjectMentoringEssentialDeveloper
//
//  Created by M on 03/11/22.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    private let webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        webView.frame = view.bounds
        webView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    func setUrl(url: URL) {
        webView.load(URLRequest(url: url))
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
