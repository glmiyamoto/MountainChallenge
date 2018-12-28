//
//  ColorExtensions.swift
//  MountainChallenge
//
//  Created by Gustavo Miyamoto on 12/28/18.
//  Copyright © 2018 Gustavo Miyamoto. All rights reserved.
//

import UIKit

extension UIColor {
    static func rgb(red: Int, green: Int, blue: Int) -> UIColor {
        return UIColor(displayP3Red: CGFloat(red) / 255.0,
                       green: CGFloat(green) / 255.0,
                       blue: CGFloat(blue) / 255.0,
                       alpha: 1.0)
    }
}
