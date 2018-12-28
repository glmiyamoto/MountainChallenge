//
//  GetMountainImageInteractorProtocol.swift
//  MountainChallenge
//
//  Created by Gustavo Miyamoto on 12/27/18.
//  Copyright © 2018 Gustavo Miyamoto. All rights reserved.
//

import AlamofireImage

protocol GetMountainImageInteractorProtocol {
    func getMountainImage(url: String)
}

protocol GetMountainImageCallback: class {
    func onSuccess(url: String, image: Image)
    func onError(error: Error)
}
