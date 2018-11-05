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
    
    var voteCount: Int
    var movieId: Int
    var video: Bool
    var voteAverage: Float
    var title: String
    var popularity: Float
    var posterPath: String
    var originalLanguage: String
    var originalTitle: String
    var genreIds:[Int]
    var backdropPath: String?
    var adult: Bool
    var overview: String
    var releaseDate: String
    
    enum CodingKeys: String, CodingKey {
        case voteCount = "vote_count"
        case movieId = "id"
        case video
        case voteAverage = "vote_average"
        case title
        case popularity
        case posterPath = "poster_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIds = "genre_ids"
        case backdropPath = "backdrop_path"
        case adult
        case overview
        case releaseDate = "release_date"
    }
}
