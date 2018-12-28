//
//  MountainDetailInterface.swift
//  MountainChallenge
//
//  Created by Gustavo Miyamoto on 26/12/18.
//  Copyright © 2018 Gustavo Miyamoto. All rights reserved.
//

import UIKit
import RxSwift

protocol MountainDetailViewModelProtocol {
    // Observables
    var data: Variable<Mountain> { get }
    var image: Variable<UIImage?> { get }
    var suggestions: Variable<[Mountain]> { get }
    var suggestionImage1: Variable<UIImage?> { get }
    var suggestionImage2: Variable<UIImage?> { get }
    var error: Variable<Error?> { get }
    
    // Methods
    func loadImage()
    func toggleLikeStatus()
}
