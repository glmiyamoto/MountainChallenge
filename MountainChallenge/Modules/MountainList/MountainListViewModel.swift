//
//  MountainListViewModel.swift
//  MountainChallenge
//
//  Created by Gustavo Miyamoto on 12/27/18.
//  Copyright © 2018 Gustavo Miyamoto. All rights reserved.
//

import Moya
import RxSwift
import RxCocoa

typealias ListUpdatedObservable = () -> ()

/**
 ViewModel class to bind mountain list information.
 */
final class MountainListViewModel {
    // MARK: - Properties
    private let interactor: GetMountainListInteractorProtocol!
    private var items: [Variable<Mountain>] = [] {
        didSet {
            // Notify list update
            listUpdated.value = Void()
        }
    }
    
    // MARK: - Observables
    var listUpdated: Variable<Void> = Variable(Void())
    var error: Variable<Error?> = Variable(nil)
    
    // MARK: - Lifecycle
    init() {
        let repository = MountainDataSource(provider: MoyaProvider<MountainApi>())
        let interactor = GetMountainListInteractor(repository: repository)
        self.interactor = interactor
        
        // Register interactor callback
        interactor.callback = self
    }
}

// MARK: - Extension - Mountain list view model protocol
extension MountainListViewModel: MountainListViewModelProtocol {
    func numberOfItens() -> Int {
        return items.count
    }
    
    func getItem(index: Int) -> Variable<Mountain> {
        return items[index]
    }
    
    func getSuggestion(index: Int) -> [Mountain] {
        // First suggestion
        let mountain = getItem(index: index).value
        let filteredItems1 = items.filter { item in
            item.value.areaId == mountain.areaId &&
            item.value.id != mountain.id
        }
        if let item1 = filteredItems1.first?.value,
            let item2 = filteredItems1.last?.value {
            return [item1, item2]
        }
        
        // Second suggestion
        let filteredItems2 = items.filter { item in
            item.value.id != mountain.id
        }
        if let item1 = filteredItems2.first?.value,
            let item2 = filteredItems2.last?.value {
            return [item1, item2]
        }
        
        return []
    }
    
    func loadMountains() {
        interactor.getMountains()
    }
}

// MARK: - Extension - Get mountain list callback
extension MountainListViewModel: GetMountainListCallback {
    func onSuccess(mountains: [Mountain]) {
        items = mountains.map { mountain in Variable(mountain) }
    }
    
    func onError(error: Error) {
        self.error.value = error
    }
}
