//
//  ResponseError.swift
//  MountainChallenge
//
//  Created by Gustavo Miyamoto on 12/27/18.
//  Copyright © 2018 Gustavo Miyamoto. All rights reserved.
//

import Foundation

enum ResponseError: Swift.Error {
    case requestFailed(String)
    case unexpected
}
