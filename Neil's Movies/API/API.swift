//
//  API.swift
//  Neil's Movies
//
//  Created by Neil Skinner on 05/11/2018.
//  Copyright © 2018 Neil Skinner. All rights reserved.
//

import Foundation

class API {
    
    let apiBase = "https://api.themoviedb.org/3/"
    let apiKey = "62d9853b69bf0225a5c7a5634438a2c2"
    
    struct APIResponse {
        var isSuccesful: Bool
        var error: APIError?
        var data: Data?
        
        enum APIError: String {
            case network = "Network Error"
            case data = "Data Error"
            case url = "URL Error"
        }
    }
    
    func get(from urlString: String, completion: @escaping (APIResponse) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(APIResponse(isSuccesful: false, error: .url, data: nil))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200,
                error == nil else {
                    completion(APIResponse(isSuccesful: false, error: .network, data: nil))
                    return
            }
            
            guard let data = data else {
                completion(APIResponse(isSuccesful: false, error: .data, data: nil))
                return
            }
            
            completion(APIResponse(isSuccesful: true, error: nil, data: data))
            }.resume()
    }
}
