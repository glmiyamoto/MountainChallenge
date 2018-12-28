//
//  MountainTableViewCellViewModelProtocol.swift
//  MountainChallenge
//
//  Created by Gustavo Miyamoto on 12/28/18.
//  Copyright © 2018 Gustavo Miyamoto. All rights reserved.
//

import UIKit
import RxSwift

protocol MountainTableViewCellViewModelProtocol {
    // Observables
    var data: Variable<Mountain> { get }
    var image: Variable<UIImage?> { get }
    var error: Variable<Error?> { get }
    
    // Methods
    func loadImage()
}
