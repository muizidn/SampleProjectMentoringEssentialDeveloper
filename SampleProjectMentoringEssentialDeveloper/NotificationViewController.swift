//
//  NotificationViewController.swift
//  SampleProjectMentoringEssentialDeveloper
//
//  Created by M on 03/11/22.
//

import UIKit

class NotificationViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setGoToButtonTitleWithName(" Yahoo - WebView - Swift")
        // Do any additional setup after loading the view.
    }
    
    override func go(toScreen sender: UIButton!) {
        let vc = YahooViewController()
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
