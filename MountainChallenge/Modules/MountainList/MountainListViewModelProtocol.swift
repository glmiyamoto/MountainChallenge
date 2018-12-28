//
//  MountainListInterface.swift
//  MountainChallenge
//
//  Created by Gustavo Miyamoto on 26/12/18.
//  Copyright © 2018 Gustavo Miyamoto. All rights reserved.
//

import RxSwift

protocol MountainListViewModelProtocol {
    // Observable
    var listUpdated: Variable<Void> { get }
    var error: Variable<Error?> { get }
    
    // Methods
    func numberOfItens() -> Int
    func getItem(index: Int) -> Variable<Mountain>
    func getSuggestion(index: Int) -> [Mountain]
    func loadMountains()
}
