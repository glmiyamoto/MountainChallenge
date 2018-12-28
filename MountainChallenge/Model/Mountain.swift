//
//  Mountain.swift
//  MountainChallenge
//
//  Created by Gustavo Miyamoto on 26/12/18.
//  Copyright © 2018 Gustavo Miyamoto. All rights reserved.
//

import Foundation

/**
 Mountain model structure
 */
struct Mountain: Decodable {
    // MARK: - Fields
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
    
    // MARK: - Enums
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
    
    init(name: String) {
        id = 0
        areaId = 0
        self.name = name
        elevation = 0.0
        description = ""
        prefectures = [String]()
        likeCount = 0
        isLike = "true"
        thumbnailUrl = ""
        imageUrl = ""
    }
}
