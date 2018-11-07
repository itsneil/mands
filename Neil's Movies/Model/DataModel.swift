//
//  DataModel.swift
//  Neil's Movies
//
//  Created by Neil Skinner on 05/11/2018.
//  Copyright © 2018 Neil Skinner. All rights reserved.
//

import Foundation
import UIKit

class DataModel {
    static let db:DataModel = DataModel()
    var configuration: ConfigurationModel?
    var imageBaseUrl: String {
        get {
            if let baseUrl = configuration?.images.baseUrl,
                let size = configuration?.images.posterSizes.last {
                return baseUrl+size
            } else {
                return ""
            }
            
        }
    }
    
    var nowPlaying: NowPlayingModel?
    var movies: [Int: MovieModel] = [:]
    var collections: [Int: CollectionModel] = [:]
    
    private let imageCache = NSCache<NSURL, UIImage>()
    
    func getImage(fromPath path: String, completion:@escaping (_ image:UIImage?) -> Void) {
        
        guard let url = URL(string: imageBaseUrl+path) else {
            completion(nil)
            return
        }
        
        if let image = imageCache.object(forKey: url as NSURL) {
            completion(image)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            if let data = data, let image = UIImage(data: data) {
                self.imageCache.setObject(image, forKey: url as NSURL)
                completion(image)
            } else {
                completion(nil)
            }
            }.resume()
    }
}
