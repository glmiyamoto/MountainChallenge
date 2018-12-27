//
//  BaseJsonProvider.swift
//  MountainChallenge
//
//  Created by Gustavo Miyamoto on 26/12/18.
//  Copyright © 2018 Gustavo Miyamoto. All rights reserved.
//

import Foundation
import RxSwift

final class JsonHelper {
    static let JsonFileExtension = "json"
    
    enum JsonProviderError: Swift.Error {
        case jsonFileNotFound
        case jsonParseFailed(String)
    }
    
    private init() {}
    
    static func decodeJsonFile<T>(_ fileName: String, type: T.Type) throws -> T where T : Decodable {
        if let url = Bundle.main.url(forResource: fileName, withExtension: JsonHelper.JsonFileExtension) {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                return try decoder.decode(type, from: data)
            } catch {
                throw JsonProviderError.jsonParseFailed("\(error)")
            }
        }
        
        throw JsonProviderError.jsonFileNotFound
    }
    
    static func decodeJsonFileAsObservable<T>(_ fileName: String, type: T.Type) -> Single<T> where T : Decodable {
        return Single.create { single in
            do {
                let decodedObject = try decodeJsonFile(fileName, type: type)
                single(.success(decodedObject))
            } catch {
                single(.error(error))
            }
            return Disposables.create()
        }
    }
}
