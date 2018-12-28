//
//  Like.swift
//  MountainChallenge
//
//  Created by Gustavo Miyamoto on 12/28/18.
//  Copyright © 2018 Gustavo Miyamoto. All rights reserved.
//

import UIKit

/**
 Like status UI representation model structure
 */
struct LikeStatus {
    // MARK: - Properties
    private let likedImage = UIImage(named: "Liked")
    private let unlikedImage = UIImage(named: "Unliked")
    
    // MARK: - Public properties
    let isLike: Bool
    
    // MARK: - Lifecycle
    init(_ isLike: String) {
        self.isLike = isLike.boolValue
    }
    
    // MARK: - Class methods
    var textColor: UIColor {
        get { return isLike ? UIColor.orange : UIColor.black }
    }
    
    var image: UIImage? {
        get { return isLike ? likedImage : unlikedImage }
    }
    
    var buttonImage: UIImage? {
        get { return isLike ? unlikedImage : likedImage }
    }
    
    var buttonBackgroundColor: UIColor {
        get { return isLike ? UIColor.rgb(red: 169, green: 169, blue: 169) : UIColor.rgb(red: 255, green: 175, blue: 83) }
    }
}
