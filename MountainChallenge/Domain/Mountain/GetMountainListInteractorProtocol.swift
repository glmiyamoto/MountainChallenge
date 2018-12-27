//
//  MountainInteractorProtocol.swift
//  MountainChallenge
//
//  Created by Gustavo Miyamoto on 12/27/18.
//  Copyright © 2018 Gustavo Miyamoto. All rights reserved.
//

protocol GetMountainListInteractorProtocol {
    func getMountains()
}

protocol GetMountainListCallback: class {
    func onSuccess(mountains: [Mountain])
    func onError(error: Error)
}
