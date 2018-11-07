//
//  NowPlayingViewController.swift
//  Neil's Movies
//
//  Created by Neil Skinner on 07/11/2018.
//  Copyright © 2018 Neil Skinner. All rights reserved.
//

import UIKit

class NowPlayingViewController: UIViewController {

    var viewModel: NowPlayingViewModel = NowPlayingViewModel()
    
    fileprivate var loadingView: UIView?
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Now Playing"
        viewModel.startWith(delegate: self)
        collectionView.delegate = viewModel
        collectionView.dataSource = viewModel
    }
}

extension NowPlayingViewController: NowPlayingViewModelDelegate {

    func isLoading(loading: Bool) {
        if loading {
            if loadingView == nil {
                loadingView = displaySpinner()
            }
        } else {
            if let loadingView = loadingView {
                removeSpinner(spinner: loadingView)
                self.loadingView = nil
            }
        }
    }
    
    func updateData() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func showMovie(withId identifier: Int) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: MovieViewController.identifier) as? MovieViewController {
            vc.movieId = identifier
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}


