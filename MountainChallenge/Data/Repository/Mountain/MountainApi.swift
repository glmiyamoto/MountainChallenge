//
//  YamapApi.swift
//  MountainChallenge
//
//  Created by Gustavo Miyamoto on 2/20/19.
//  Copyright © 2019 Gustavo Miyamoto. All rights reserved.
//

import Moya

enum MountainApi {
    case mountains
    case mountainImage(_ url: String)
}

extension MountainApi: TargetType {
    var baseURL: URL {
        switch self {
        case .mountainImage(let url):
            return URL(string: url)!
        default:
            return URL(string: "https://s3-ap-northeast-1.amazonaws.com/file.yamap.co.jp/ios")!
        }
        
    }
    
    var path: String {
        switch self {
        case .mountains:
            return "/mountains.json"
        case .mountainImage:
            return ""
        }
    }
    
    var method: Method {
        switch self {
        case .mountains, .mountainImage:
            return .get
        }
    }
    
    var sampleData: Data {
        do {
            switch self {
            case .mountains:
                return try ResourceHelper.readJsonFile("mountains.json")
            case .mountainImage:
                return Data()
            }
        } catch {
            return Data()
        }
    }
    
    var task: Task {
        switch self {
        case .mountains, .mountainImage:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}
