//
//  MovieViewController.swift
//  Neil's Movies
//
//  Created by Neil Skinner on 07/11/2018.
//  Copyright © 2018 Neil Skinner. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    
    static let identifier = "MovieViewController_Identifier"
    var movieId: Int!
    var viewModel: MovieViewModel = MovieViewModel()
    fileprivate var loadingView: UIView?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Movie Details"
        viewModel.startWith(movieId: movieId, withDelegate: self)
        tableView.delegate = viewModel
        tableView.dataSource = viewModel
        tableView.rowHeight = UITableView.automaticDimension
    }
    
}

extension MovieViewController: MovieViewModelDelegate {
    
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
            self.tableView.reloadData()
        }
    }
    
    func showBackgroundImage(image: UIImage) {
        DispatchQueue.main.async {
            self.imageView.image = image
        }
    }
    
    func showMovie(withId identifier: Int) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: MovieViewController.identifier) as? MovieViewController {
            vc.movieId = identifier
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
