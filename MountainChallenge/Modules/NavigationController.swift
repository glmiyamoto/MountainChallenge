//
//  BaseNavigationController.swift
//  MountainChallenge
//
//  Created by Gustavo Miyamoto on 2/19/19.
//  Copyright © 2019 Gustavo Miyamoto. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    func showLoading() {
        let overlayView = UIView(frame: UIScreen.main.bounds)
        overlayView.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.5)
        overlayView.tag = Int.max
        view.addSubview(overlayView)
        
        let activityIndicator = UIActivityIndicatorView(style: .gray)
        activityIndicator.tag = Int.max
        activityIndicator.hidesWhenStopped = true
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        overlayView.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: overlayView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: overlayView.centerYAnchor),
        ])
        
        activityIndicator.startAnimating()
    }
    
    func hideLoading() {
        if let overlayView = view.subviews.filter({view in view.tag == Int.max}).first {
            if let activityIndicator = overlayView.subviews.filter({view in view is UIActivityIndicatorView && view.tag == Int.max}).first as? UIActivityIndicatorView {
                activityIndicator.stopAnimating()
                activityIndicator.removeFromSuperview()
            }
            
            overlayView.removeFromSuperview()
        }
    }
}
