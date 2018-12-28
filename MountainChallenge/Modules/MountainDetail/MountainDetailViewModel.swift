//
//  MountainDetailViewModel.swift
//  MountainChallenge
//
//  Created by Gustavo Miyamoto on 12/28/18.
//  Copyright © 2018 Gustavo Miyamoto. All rights reserved.
//

import RxSwift
import AlamofireImage

/**
 ViewModel class to bind mountain detail information.
 */
final class MountainDetailViewModel {
    // MARK: - Properties
    private let interactor: GetMountainImageInteractor!
    
    // MARK: - Observable
    var data: Variable<Mountain>
    var image: Variable<UIImage?> = Variable(nil)
    var suggestions: Variable<[Mountain]>
    var suggestionImage1: Variable<UIImage?> = Variable(nil)
    var suggestionImage2: Variable<UIImage?> = Variable(nil)
    var error: Variable<Error?> = Variable(nil)
    
    // MARK: - Lifecycle
    init(mountain: Variable<Mountain>, suggestions: [Mountain]) {
        // Initilize observables
        data = mountain
        self.suggestions = Variable(suggestions)
        
        // Initialize interactor
        let repository = YamapProvider.mountainDataSource
        interactor = GetMountainImageInteractor(repository: repository)
        interactor.callback = self
    }
    
    // MARK: - Class methods
    private var firstSuggestion: Mountain? {
        return suggestions.value.first
    }
    
    private var secondSuggestion: Mountain? {
        return suggestions.value.last
    }
}

// MARK: - Extension - Mountain detail view model protocol
extension MountainDetailViewModel: MountainDetailViewModelProtocol {
    func loadImage() {
        interactor.getMountainImage(url: data.value.imageUrl)
        
        if let item1 = firstSuggestion {
            interactor.getMountainImage(url: item1.thumbnailUrl)
        }
        
        if let item2 = secondSuggestion {
            interactor.getMountainImage(url: item2.thumbnailUrl)
        }
    }
    
    func toggleLikeStatus() {
        let isLike = data.value.isLike.boolValue
        var mountain = data.value
        mountain.isLike = String(!isLike).lowercased()
        data.value = mountain
    }
}

// MARK: - Extension - Get mountain image callback
extension MountainDetailViewModel: GetMountainImageCallback {
    func onSuccess(url: String, image: Image) {
        if data.value.imageUrl == url {
            self.image.value = image.af_imageRounded(withCornerRadius: 15.0)
        } else if let item1 = firstSuggestion, item1.thumbnailUrl == url {
            self.suggestionImage1.value = image.af_imageRoundedIntoCircle()
        } else if let item2 = secondSuggestion, item2.thumbnailUrl == url {
            self.suggestionImage2.value = image.af_imageRoundedIntoCircle()
        }
    }
    
    func onError(error: Error) {
        self.error.value = error
    }
}
