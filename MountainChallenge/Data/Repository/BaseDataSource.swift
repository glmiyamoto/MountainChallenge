//
//  BaseDataSource.swift
//  MountainChallenge
//
//  Created by Gustavo Miyamoto on 2/20/19.
//  Copyright © 2019 Gustavo Miyamoto. All rights reserved.
//

import Moya

class BaseDataSource<API: TargetType> {
    internal let provider: MoyaProvider<API>
    
    init(provider: MoyaProvider<API>) {
        self.provider = provider
    }
}
