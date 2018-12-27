//
//  Mountain.swift
//  MountainChallenge
//
//  Created by Gustavo Miyamoto on 26/12/18.
//  Copyright © 2018 Gustavo Miyamoto. All rights reserved.
//

import Foundation

struct Mountain: Decodable {
    var id: Int
    var areaId: Int
    var name: String
    var elevation: Double
    var description: String
    var prefectures: [String]
    var likeCount: Int
    var isLike: String
    var thumbnailUrl: String
    var imageUrl: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case areaId = "area_id"
        case name
        case elevation
        case description
        case prefectures
        case likeCount = "like_count"
        case isLike = "is_like"
        case thumbnailUrl = "thumbnail_url"
        case imageUrl = "image_url"
    }
}
