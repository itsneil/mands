//
//  APINowPlaying.swift
//  Neil's Movies
//
//  Created by Neil Skinner on 05/11/2018.
//  Copyright © 2018 Neil Skinner. All rights reserved.
//

import Foundation

class APINowPlaying : API {
   
    static let shared = APINowPlaying()
    
    let nowPlayingEndpoint = "movie/now_playing"
    
    func getNowPlaying(completion: @escaping (NowPlayingModel?) -> Void) {
        let urlString = apiBase+nowPlayingEndpoint+"?api_key="+apiKey
        
        get(from: urlString) { (response) in
            if let data = response.data {
                do {
                    let model = try JSONDecoder().decode(NowPlayingModel.self, from: data)
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
