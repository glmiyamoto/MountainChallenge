//
//  BaseViewController.swift
//  MountainChallenge
//
//  Created by Gustavo Miyamoto on 2/19/19.
//  Copyright © 2019 Gustavo Miyamoto. All rights reserved.
//

import UIKit

protocol BaseViewController {
}

extension BaseViewController {
    func showLoading(on navigationController: UINavigationController?) {
        if let navigation = navigationController as? NavigationController {
            navigation.showLoading()
        }
    }
    
    func hideLoding(on navigationController: UINavigationController?) {
        if let navigation = navigationController as? NavigationController {
            navigation.hideLoading()
        }
    }
}
