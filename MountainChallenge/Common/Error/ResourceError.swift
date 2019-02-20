//
//  ResourceError.swift
//  MountainChallenge
//
//  Created by Gustavo Miyamoto on 2/20/19.
//  Copyright © 2019 Gustavo Miyamoto. All rights reserved.
//

import Foundation

enum ResourceError: Swift.Error {
    case fileNotFound
    case contentReadFailed
    case unexpected
}
