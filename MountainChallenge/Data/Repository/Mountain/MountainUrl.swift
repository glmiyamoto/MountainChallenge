//
//  MountainUrl.swift
//  MountainChallenge
//
//  Created by Gustavo Miyamoto on 2/19/19.
//  Copyright © 2019 Gustavo Miyamoto. All rights reserved.
//

import Foundation

enum MountainUrl {
    case mountains
}

extension MountainUrl: RequestUrl {
    internal var path: String {
        switch self {
        case .mountains:
            return "mountains.json"
        }
    }
}
