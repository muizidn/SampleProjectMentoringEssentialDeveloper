//
//  YahooViewController.swift
//  SampleProjectMentoringEssentialDeveloper
//
//  Created by M on 03/11/22.
//

import UIKit

class YahooViewController: WebViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUrl(url: URL(string: "https://www.yahoo.com")!)
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