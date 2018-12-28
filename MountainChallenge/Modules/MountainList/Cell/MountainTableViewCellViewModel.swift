//
//  MountainCellViewModel.swift
//  MountainChallenge
//
//  Created by Gustavo Miyamoto on 12/27/18.
//  Copyright © 2018 Gustavo Miyamoto. All rights reserved.
//

import RxSwift
import AlamofireImage

/**
 ViewModel class to bind mountain table view cell information.
 */
final class MountainTableViewCellViewModel {
    // MARK: - Properties
    private let interactor: GetMountainImageInteractor!
    
    // MARK: - Observable
    var data: Variable<Mountain>
    var image: Variable<UIImage?> = Variable(nil)
    var error: Variable<Error?> = Variable(nil)
    
    // MARK: - Lifecycle
    init(mountain: Variable<Mountain>) {
        // Initilize observables
        data = mountain
        
        // Initialize interactor
        let repository = YamapProvider.mountainDataSource
        interactor = GetMountainImageInteractor(repository: repository)
        interactor.callback = self
    }
}

// MARK: - Extension - Mountain table view cell view model protocol
extension MountainTableViewCellViewModel: MountainTableViewCellViewModelProtocol {
    func loadImage() {
        let url: String = data.value.thumbnailUrl
        interactor.getMountainImage(url: url)
    }
}

// MARK: - Extension - Get mountain image callback
extension MountainTableViewCellViewModel: GetMountainImageCallback {
    func onSuccess(url: String, image: Image) {
        self.image.value = image.af_imageRoundedIntoCircle()
    }
    
    func onError(error: Error) {
        self.error.value = error
    }
}
