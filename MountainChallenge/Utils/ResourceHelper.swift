//
//  ResourceHelper.swift
//  MountainChallenge
//
//  Created by Gustavo Miyamoto on 2/20/19.
//  Copyright © 2019 Gustavo Miyamoto. All rights reserved.
//

import Foundation

final class ResourceHelper {
    static func readJsonFile(_ fileName: String) throws -> Data {
        if let url = Bundle.main.url(forResource: fileName, withExtension: JsonHelper.JsonFileExtension) {
            do {
                return try Data(contentsOf: url)
            } catch {
                throw ResourceError.contentReadFailed
            }
        } else {
            throw ResourceError.fileNotFound
        }
    }
}
