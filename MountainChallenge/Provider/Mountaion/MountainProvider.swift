//
//  MountainProvider.swift
//  MountainChallenge
//
//  Created by Gustavo Miyamoto on 26/12/18.
//  Copyright © 2018 Gustavo Miyamoto. All rights reserved.
//

import Foundation
import RxSwift

enum MountainProvider {
    case getMountains
    
    internal var fileName: String {
        switch self {
        case .getMountains:
            return "mountains"
        }
    }
}

extension MountainProvider: MountainProviderProtocol {
    func getMountains() -> Single<[Mountain]> {
        return JsonHelper.decodeJsonFileAsObservable(fileName, type: [Mountain].self)
    }
}
