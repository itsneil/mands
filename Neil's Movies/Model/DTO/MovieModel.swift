//
//  MovieModel.swift
//  Neil's Movies
//
//  Created by Neil Skinner on 06/11/2018.
//  Copyright © 2018 Neil Skinner. All rights reserved.
//

import Foundation

struct MovieModel: Codable {
    
    var belongsToCollection: BelongsToCollectionModel?
    var identifier: Int
    var overview: String
    var backdropPath: String
    var releaseDate: String
    var runtime: Int
    var tagline: String
    var title: String
    
    enum CodingKeys: String, CodingKey {
        case belongsToCollection = "belongs_to_collection"
        case identifier = "id"
        case overview
        case backdropPath = "backdrop_path"
        case releaseDate = "release_date"
        case runtime
        case tagline
        case title
    }
}

struct BelongsToCollectionModel: Codable {
    
    var identifier: Int
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name = "name"
    }
}
