//
//  MountainProviderProtocol.swift
//  MountainChallenge
//
//  Created by Gustavo Miyamoto on 26/12/18.
//  Copyright © 2018 Gustavo Miyamoto. All rights reserved.
//

import Foundation

typealias MountainsCallback = (_ mountains: [Mountain]) -> Swift.Void
typealias FailureCallback = (_ error: Error) -> Swift.Void

protocol MountainProviderProtocol {
    func getMountains(_ successBlock: @escaping MountainsCallback, failureBlock: @escaping FailureCallback)
}
