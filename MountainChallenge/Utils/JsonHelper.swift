//
//  BaseJsonProvider.swift
//  MountainChallenge
//
//  Created by Gustavo Miyamoto on 26/12/18.
//  Copyright © 2018 Gustavo Miyamoto. All rights reserved.
//

import Foundation

/**
 Helper class for JSON.
 */
final class JsonHelper {
    // MARK: - Constants
    static let JsonFileExtension = "json"
    
    // MARK: - Constructors
    private init() {}
    
    // MARK: - Class methods
    static func decodeJsonFile<T>(_ fileName: String, type: T.Type) throws -> T where T : Decodable {
        if let url = Bundle.main.url(forResource: fileName, withExtension: JsonHelper.JsonFileExtension) {
            let data = try Data(contentsOf: url)
            return try decodeJsonData(data, type: type)
        }
        
        throw JsonDecodeError.jsonFileNotFound
    }
    
    // MARK: - Class methods
    static func decodeJsonData<T>(_ data: Data?, type: T.Type) throws -> T where T : Decodable {
        if let json = data {
            do {
                let decoder = JSONDecoder()
                return try decoder.decode(type, from: json)
            } catch {
                throw JsonDecodeError.jsonParseFailed("\(error)")
            }
        } else {
            throw JsonDecodeError.invalidParseData
        }
    }
}
