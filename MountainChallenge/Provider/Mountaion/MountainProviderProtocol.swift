//
//  MountainProviderProtocol.swift
//  MountainChallenge
//
//  Created by Gustavo Miyamoto on 26/12/18.
//  Copyright © 2018 Gustavo Miyamoto. All rights reserved.
//

import Foundation
import RxSwift

protocol MountainProviderProtocol {
    func getMountains() -> Single<[Mountain]>
}
