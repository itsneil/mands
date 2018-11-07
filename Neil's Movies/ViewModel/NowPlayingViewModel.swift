//
//  NowPlayingViewModel.swift
//  Neil's Movies
//
//  Created by Neil Skinner on 07/11/2018.
//  Copyright © 2018 Neil Skinner. All rights reserved.
//

import UIKit

protocol NowPlayingViewModelDelegate: class {
    func isLoading(loading: Bool)
    func updateData()
}

class NowPlayingViewModel: NSObject {

    weak var delegate: NowPlayingViewModelDelegate?
    
    func startWith(delegate: NowPlayingViewModelDelegate) {
        self.delegate = delegate
        self.delegate?.isLoading(loading: true)
        APINowPlaying.shared.getNowPlaying { (model) in
            self.delegate?.isLoading(loading: false)
            DataModel.db.nowPlaying = model
            self.delegate?.updateData()
        }
    }
}

extension NowPlayingViewModel: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataModel.db.nowPlaying?.nowPlayingMovies.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let nowPlaying = DataModel.db.nowPlaying, let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NowPlayingCollectionViewCell.identifier, for: indexPath) as? NowPlayingCollectionViewCell {
            cell.setCell(withModel: nowPlaying.nowPlayingMovies[indexPath.row])
            return cell
        }
        
        return UICollectionViewCell()
    }
    
}
