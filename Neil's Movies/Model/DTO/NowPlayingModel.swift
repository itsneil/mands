//
//  NowPlayingModel.swift
//  Neil's Movies
//
//  Created by Neil Skinner on 05/11/2018.
//  Copyright © 2018 Neil Skinner. All rights reserved.
//

import Foundation

class NowPlayingModel: Codable {
    
    var nowPlayingMovies:[NowPlayingMovieModel] = []
    
    enum CodingKeys: String, CodingKey {
        case nowPlayingMovies = "results"
    }
}

struct NowPlayingMovieModel: Codable {
    
    var identifier: Int
    var title: String
    var posterPath: String
    var backdropPath: String?
    var overview: String
    var releaseDate: String
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case title
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case overview
        case releaseDate = "release_date"
    }
}
