//
//  MovieViewModel.swift
//  Neil's Movies
//
//  Created by Neil Skinner on 07/11/2018.
//  Copyright © 2018 Neil Skinner. All rights reserved.
//

import Foundation
import UIKit

protocol MovieViewModelDelegate: class {
    func isLoading(loading: Bool)
    func updateData()
    func showBackgroundImage(image: UIImage)
    func showMovie(withId identifier: Int)
}

class MovieViewModel: NSObject {
    
    weak var delegate: MovieViewModelDelegate?
    var movieId:Int!
    fileprivate var collectionId: Int?
    
    func startWith(movieId movie:Int, withDelegate delegate: MovieViewModelDelegate) {
        self.delegate = delegate
        self.movieId = movie
        self.delegate?.isLoading(loading: true)
        APIMovie.shared.getMovie(withId: movie) { (model) in
            DataModel.db.movies[movie] = model
            
            if let path = model?.backdropPath {
                DataModel.db.getImage(fromPath: path, completion: { (image) in
                    if let image = image {
                        self.delegate?.showBackgroundImage(image: image)
                    }
                })
            }
            
            if let collectionId = model?.belongsToCollection?.identifier {
                self.collectionId = collectionId
                APICollection.shared.getCollection(withId: collectionId, completion: { (model) in
                    DataModel.db.collections[collectionId] = model
                    self.delegate?.isLoading(loading: false)
                    self.delegate?.updateData()
                })
            } else {
                self.delegate?.isLoading(loading: false)
                self.delegate?.updateData()
            }
        }
    }
}

extension MovieViewModel: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if collectionId != nil {
            return 2
        }
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let collectionId = self.collectionId, section == 1 {
            return DataModel.db.collections[collectionId]?.parts.count ?? 0
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if let model = DataModel.db.movies[movieId], let cell = tableView.dequeueReusableCell(withIdentifier: MovieDetailsTableViewCell.identifier, for: indexPath) as? MovieDetailsTableViewCell {
                cell.setCell(withModel: model)
                cell.selectionStyle = .none
                return cell
            }
        } else if indexPath.section == 1 {
            if let collectionId = self.collectionId,
                let collectionModel = DataModel.db.collections[collectionId],
                let cell = tableView.dequeueReusableCell(withIdentifier: MovieCollectionTableViewCell.identifier, for: indexPath) as? MovieCollectionTableViewCell {
                cell.setCell(withModel: collectionModel.parts[indexPath.row])
                cell.selectionStyle = .none
                return cell
            }
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1,
            let collectionId = self.collectionId,
            let collectionModel = DataModel.db.collections[collectionId] {
            delegate?.showMovie(withId: collectionModel.parts[indexPath.row].identifier)
        }
    }
    
}
