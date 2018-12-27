//
//  BaseJsonProvider.swift
//  MountainChallenge
//
//  Created by Gustavo Miyamoto on 26/12/18.
//  Copyright © 2018 Gustavo Miyamoto. All rights reserved.
//

import Foundation

final class JsonHelper {
    // MARK: - Constants
    static let JsonFileExtension = "json"
    
    // MARK: - Constructors
    private init() {}
    
    // MARK: - Class methods
    static func decodeJsonFile<T>(_ fileName: String, type: T.Type) throws -> T where T : Decodable {
        if let url = Bundle.main.url(forResource: fileName, withExtension: JsonHelper.JsonFileExtension) {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                return try decoder.decode(type, from: data)
            } catch {
                throw JsonDecodeError.jsonParseFailed("\(error)")
            }
        }
        
        throw JsonDecodeError.jsonFileNotFound
    }
}
