//
//  APICollection.swift
//  Neil's Movies
//
//  Created by Neil Skinner on 05/11/2018.
//  Copyright © 2018 Neil Skinner. All rights reserved.
//

import Foundation

class APICollection : API {
    
    static let shared = APICollection()
    
    let collectionEndpoint = "collection/"
    
    func getCollection(withId identifier:Int, completion: @escaping (CollectionModel?) -> Void) {
        let urlString = apiBase+collectionEndpoint+String(describing: identifier)+"?api_key="+apiKey
        
        get(from: urlString) { (response) in
            if let data = response.data {
                do {
                    let model = try JSONDecoder().decode(CollectionModel.self, from: data)
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
