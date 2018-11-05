//
//  APIConfiguration.swift
//  Neil's Movies
//
//  Created by Neil Skinner on 05/11/2018.
//  Copyright © 2018 Neil Skinner. All rights reserved.
//

import Foundation

class APIConfiguration: API {
    
    static let shared = APIConfiguration()
    
    let configurationEndpoint = "configuration"
    
    func getConfiguration() {
        let urlString = apiBase+configurationEndpoint+"?api_key="+apiKey
        
        get(from: urlString) { (response) in
            if let data = response.data {
                do {
                    let model = try JSONDecoder().decode(ConfigurationModel.self, from: data)
                        DataModel.db.configuration = model
                    return
                } catch _ {
                    // NO OP
                }
            }
        }
    }
}
