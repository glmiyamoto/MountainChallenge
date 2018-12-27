//
//  YamapProvider.swift
//  MountainChallenge
//
//  Created by Gustavo Miyamoto on 26/12/18.
//  Copyright © 2018 Gustavo Miyamoto. All rights reserved.
//

import Foundation
import RxSwift

enum YamapProvider {
    case mountainDataSource
    
    // MARK: - Class fields
    internal var fileName: String {
        switch self {
        case .mountainDataSource:
            return "mountains"
        }
    }
}