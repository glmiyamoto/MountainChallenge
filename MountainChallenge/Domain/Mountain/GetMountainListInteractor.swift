//
//  MountainInteractor.swift
//  MountainChallenge
//
//  Created by Gustavo Miyamoto on 12/27/18.
//  Copyright © 2018 Gustavo Miyamoto. All rights reserved.
//

import RxSwift

/**
 Interactor class that contain get mountain list use case
 */
final class GetMountainListInteractor {
    // MARK: - Repository
    var repository: MountainRepository!
    
    // MARK: - Callback protocol
    weak var callback: GetMountainListCallback?
    
    // MARK: - Constructor
    init(repository: MountainRepository) {
        self.repository = repository
    }
}

// MARK: - Extension - Get mountain list interactor protocol
extension GetMountainListInteractor: GetMountainListInteractorProtocol {
    func getMountains() {
        _ = repository.getMountains()
            .observeOn(MainScheduler.instance)
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .subscribe(onSuccess: { mountains in
                self.callback?.onSuccess(mountains: mountains)
            }, onError: { error in
                self.callback?.onError(error: error)
            })
    }
}
