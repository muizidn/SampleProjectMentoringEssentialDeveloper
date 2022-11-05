//
//  ProfileViewController.swift
//  SampleProjectMentoringEssentialDeveloper
//
//  Created by M on 05/11/22.
//

import Foundation
import ThirdParty

// Sample ViewController that tight coupling with 3rd party UI framework

final class ProfileViewController: ViewController {
    let activityView = ThirdPartyActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(activityView)
        activityView.center = view.center
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        activityView.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.activityView.stopAnimating()
        }
    }
    
    override func go(toScreen sender: UIButton!) {
        let vc = ThirdPartyViewController()
        vc.params = [
            "Param1",
            "Param2"
        ]
        vc.show(in: self)
    }
}
