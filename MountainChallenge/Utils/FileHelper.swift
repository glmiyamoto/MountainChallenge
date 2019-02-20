//
//  FileHelper.swift
//  MountainChallenge
//
//  Created by Gustavo Miyamoto on 2/20/19.
//  Copyright © 2019 Gustavo Miyamoto. All rights reserved.
//

import Foundation

final class ResourceHelper {
    static func getJsonFile(_ fileName: String) -> Data {
        do {
            if let url = Bundle.main.url(forResource: fileName, withExtension: JsonHelper.JsonFileExtension) {
                return try Data(contentsOf: url)
            }
        } catch {
        }
        
        return Data()
    }
}
