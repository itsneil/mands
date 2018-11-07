//
//  CollectionModel.swift
//  Neil's Movies
//
//  Created by Neil Skinner on 06/11/2018.
//  Copyright © 2018 Neil Skinner. All rights reserved.
//

import Foundation

struct CollectionModel: Codable {
    
    var identifier: Int
    var name: String
    var overview: String
    var posterPath: String
    var backdropPath: String
    var parts: [CollectionPartModel]
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name
        case overview
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case parts
    }
}

struct CollectionPartModel: Codable {
    
    var backdropPath: String
    var identifier: Int
    var overview: String
    var posterPath: String
    var releaseDate: String
    var title: String
    
    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case identifier = "id"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
    }
}
