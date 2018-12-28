//
//  StringExtensions.swift
//  MountainChallenge
//
//  Created by Gustavo Miyamoto on 12/28/18.
//  Copyright © 2018 Gustavo Miyamoto. All rights reserved.
//

import Foundation

extension String {
    var boolValue: Bool {
        return NSString(string: self).boolValue
    }
}
