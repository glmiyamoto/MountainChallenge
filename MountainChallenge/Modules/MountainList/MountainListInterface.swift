//
//  MountainListInterface.swift
//  MountainChallenge
//
//  Created by Gustavo Miyamoto on 26/12/18.
//  Copyright © 2018 Gustavo Miyamoto. All rights reserved.
//

enum MountainListNavigation {
    case showDetail(_ item: Mountain)
}

protocol MountainListWireframeInterface {
    func navigate(to option: MountainListNavigation)
}

protocol MountainListViewInterface {
    func selectItem(_ index: Int)
}

protocol MountainListPresenterInterface {
    func updateListUi()
}

protocol MountainListInteractorInterface {
    func like(_ liked: Bool)
}
