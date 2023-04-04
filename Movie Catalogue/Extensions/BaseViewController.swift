//
//  BaseViewController.swift
//  Movie Catalogue
//
//  Created by Neosoft on 31/03/23.
//

import UIKit

class BaseViewController: UIViewController {
    
    var activityView = UIActivityIndicatorView(style: .large)

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func startLoader() {
        activityView.center = self.view.center
        activityView.startAnimating()
        self.view.addSubview(activityView)
    }
    
    func stopLoader() {
        activityView.stopAnimating()
        activityView.isHidden = true
    }
}
