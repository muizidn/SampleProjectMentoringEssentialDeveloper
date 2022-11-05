//
//  ThirdPartyView.swift
//  ThirdParty
//
//  Created by M on 05/11/22.
//

import UIKit

public final class ThirdPartyLabelView: UILabel {
    public override var text: String? {
        get { super.text }
        set {
            super.text = "ThirdPartyLabel Injected Via IB: \(newValue ?? "")"
        }
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        DispatchQueue.main.async { [weak self] in
            self?.text = self?.text
        }
        backgroundColor = .red
    }
}

public final class ThirdPartyActivityIndicatorView: UIActivityIndicatorView {
    
}

public final class ThirdPartyViewController: UIViewController {
    public var params: [String] = []
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        title = "ThirdPartyViewController"
        let label = UILabel()
        label.text = params.joined(separator: "\n")
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        view.addSubview(label)
        label.frame = view.bounds
        view.backgroundColor = .white
    }
    
    public func show(in source: UIViewController) {
        let nav = UINavigationController(rootViewController: self)
        source.present(nav, animated: true)
    }
}
