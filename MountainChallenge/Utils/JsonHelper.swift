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
        let data = try ResourceHelper.readJsonFile(fileName)
        return try decodeJsonData(data, type: type)
    }
    
    static func decodeJsonData<T>(_ data: Data?, type: T.Type) throws -> T where T : Decodable {
        if let json = data {
            if !json.isEmpty {
                do {
                    let decoder = JSONDecoder()
                    return try decoder.decode(type, from: json)
                } catch {
                    throw JsonDecodeError.jsonParseFailed("\(error)")
                }
            } else {
                throw JsonDecodeError.emptyJsonData
            }
        } else {
            throw JsonDecodeError.invalidParseData
        }
    }
}
