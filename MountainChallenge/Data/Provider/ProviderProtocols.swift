//
//  ProviderProtocols.swift
//  MountainChallenge
//
//  Created by Gustavo Miyamoto on 2/19/19.
//  Copyright © 2019 Gustavo Miyamoto. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage
import RxSwift

protocol Provider {
    var fileName: String { get }
    var basePath: String { get }
}

extension Provider {
    internal func get<T: Decodable>(_ url: RequestUrl) -> Single<T> {
        return Single.create { single in
            Alamofire.request(self.basePath + url.path).responseJSON { response in
                self.resumeResponse(single, response: response)
            }
            
            return Disposables.create()
        }
    }
    
    fileprivate func resumeResponse<T: Decodable>(_ single: (@escaping (SingleEvent<T>) -> ()), response: (DataResponse<Any>)) {
        if response.result.isSuccess, let data = response.data {
            do {
                let decodedData = try JsonHelper.decodeJsonData(data, type: T.self)
                single(.success(decodedData))
            } catch {
                single(.error(error))
            }
        }
        
        if let error = response.error {
            single(.error(ResponseError.requestFailed(error.localizedDescription)))
        }
        
        single(.error(ResponseError.unexpected))
    }
    
    internal func image(_ url: String) -> Single<Image> {
        return Single.create { single in
            Alamofire.request(url).responseImage { response in
                if response.result.isSuccess, let image = response.result.value {
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

protocol RequestUrl {
    var path: String { get }
}
