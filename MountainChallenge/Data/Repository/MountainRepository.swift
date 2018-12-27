//
//  MountainRepository.swift
//  MountainChallenge
//
//  Created by Gustavo Miyamoto on 26/12/18.
//  Copyright © 2018 Gustavo Miyamoto. All rights reserved.
//

import Alamofire
import AlamofireImage
import RxSwift

protocol MountainRepository {
    func getMountains() -> Single<[Mountain]>
    func getMountainImage(url: String) -> Single<Image>
}

// MARK: - Extension - Mountain Repository
extension YamapProvider: MountainRepository {
    // MARK: Protocol implementation
    func getMountains() -> Single<[Mountain]> {
        return Single.create { single in
            do {
                let decodedData = try JsonHelper.decodeJsonFile(self.fileName, type: [Mountain].self)
                single(.success(decodedData))
            } catch {
                single(.error(error))
            }
            return Disposables.create()
        }
    }
    
    func getMountainImage(url: String) -> Single<Image> {
        return Single.create { single in
            Alamofire.request(url).responseImage { response in
                if let image = response.result.value {
                    single(.success(image))
                }
                
                if let error = response.error {
                    single(.error(ResponseError.requestFailed(error.localizedDescription)))
                }
                
                single(.error(ResponseError.unexpected))
            }
            return Disposables.create()
        }
    }
}
