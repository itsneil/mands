//
//  APIMovie.swift
//  Neil's Movies
//
//  Created by Neil Skinner on 05/11/2018.
//  Copyright © 2018 Neil Skinner. All rights reserved.
//

import Foundation

class APIMovie : API {
    static let shared = APIMovie()
    
    let movieEndpoint = "movie/"
    
    func getMovie(withId identifier:Int, completion: @escaping (MovieModel?) -> Void) {
        let urlString = apiBase+movieEndpoint+String(describing: identifier)+"?api_key="+apiKey
        
        get(from: urlString) { (response) in
            if let data = response.data {
                do {
                    let model = try JSONDecoder().decode(MovieModel.self, from: data)
                    completion(model)
                    return
                } catch _ {
                    completion(nil)
                }
            }
            completion(nil)
        }
    }
}
