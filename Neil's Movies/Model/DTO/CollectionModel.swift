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
    
    var identifier: Int
    var title: String
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case title
    }
}
