//
//  MountainDataSource.swift
//  MountainChallenge
//
//  Created by Gustavo Miyamoto on 2/20/19.
//  Copyright © 2019 Gustavo Miyamoto. All rights reserved.
//

import Moya
import RxSwift

final class MountainDataSource: BaseDataSource<MountainApi> {}

extension MountainDataSource: MountainRepository {
    func getMountains() -> Single<[Mountain]> {
        return provider.rx.request(.mountains).map { response in
             try JsonHelper.decodeJsonData(response.data, type: [Mountain].self)
        }
    }
    
    func getMountainImage(url: String) -> Single<Image> {
        return provider.rx.request(.mountainImage(url)).map { response in
            try response.mapImage()
        }
    }
    
    
}
