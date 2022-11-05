//
//  StoreViewController.swift
//  SampleProjectMentoringEssentialDeveloper
//
//  Created by M on 03/11/22.
//

import UIKit

// Sample ViewController that go to webview

class StoreViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setGoToButtonTitleWithName(" Google - WebView - Swift")
        // Do any additional setup after loading the view.
    }
    
    override func go(toScreen sender: UIButton!) {
        let vc = GoogleViewController()
        vc.searchQuery = "swiftui"
        navigationController?.pushViewController(vc, animated: true)
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
