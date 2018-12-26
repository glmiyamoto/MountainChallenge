//
//  MountainDetailInterface.swift
//  MountainChallenge
//
//  Created by Gustavo Miyamoto on 26/12/18.
//  Copyright © 2018 Gustavo Miyamoto. All rights reserved.
//

enum MountainDetailNavigation {
    case back
}

protocol MountainDetailWireframeInterface {
    func navigate(to option: MountainDetailNavigation)
}

protocol MountainDetailViewInterface {
    func like()
}

protocol MountainDetailPresenterInterface {
    func updateLikeUi()
}

protocol MountainDetailInteractorInterface {
    func like(_ liked: Bool)
}
