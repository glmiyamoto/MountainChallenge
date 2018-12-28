//
//  GetMountainImageInteractor.swift
//  MountainChallenge
//
//  Created by Gustavo Miyamoto on 12/27/18.
//  Copyright © 2018 Gustavo Miyamoto. All rights reserved.
//

import RxSwift

/**
 Interactor class that contain get mountain image use case
 */
final class GetMountainImageInteractor {
    // MARK: - Repository
    var repository: MountainRepository!
    
    // MARK: - Callback protocol
    weak var callback: GetMountainImageCallback?
    
    // MARK: - Constructor
    init(repository: MountainRepository) {
        self.repository = repository
    }
}

// MARK: - Extension - Get mountain image interactor protocol
extension GetMountainImageInteractor: GetMountainImageInteractorProtocol {
    // MARK: - Protocol 
    func getMountainImage(url: String) {
        _ = repository.getMountainImage(url: url)
            .observeOn(MainScheduler.instance)
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .subscribe(onSuccess: { image in
                self.callback?.onSuccess(url: url, image: image)
            }, onError: { error in
                self.callback?.onError(error: error)
            })
    }
}
