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
}

extension YamapProvider: Provider {
    // MARK: - Class fields
    internal var fileName: String {
        switch self {
        case .mountainDataSource:
            return "mountains"
        }
    }
    
    internal var basePath: String {
        switch self {
        case .mountainDataSource:
            return "https://s3-ap-northeast-1.amazonaws.com/file.yamap.co.jp/ios/"
        }
    }
}
