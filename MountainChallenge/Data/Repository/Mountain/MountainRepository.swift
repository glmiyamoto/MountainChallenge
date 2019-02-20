//
//  MountainRepository.swift
//  MountainChallenge
//
//  Created by Gustavo Miyamoto on 26/12/18.
//  Copyright © 2018 Gustavo Miyamoto. All rights reserved.
//

import AlamofireImage
import RxSwift

protocol MountainRepository {
    func getMountains() -> Single<[Mountain]>
    func getMountainImage(url: String) -> Single<Image>
}
