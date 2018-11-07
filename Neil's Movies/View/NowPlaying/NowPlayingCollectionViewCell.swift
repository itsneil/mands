//
//  NowPlayingCollectionViewCell.swift
//  Neil's Movies
//
//  Created by Neil Skinner on 07/11/2018.
//  Copyright © 2018 Neil Skinner. All rights reserved.
//

import UIKit

class NowPlayingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "NowPlayingCollectionViewCell_Identifier"
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func setCell(withModel model: NowPlayingMovieModel) {
        self.titleLabel.text = model.title
        
        weak var weakImageView = self.backgroundImageView
        DataModel.db.getImage(fromPath: model.posterPath) { (image) in
            DispatchQueue.main.async {
                weakImageView?.image = image
            }
        }
    }
    
    override func prepareForReuse() {
        self.titleLabel.text = ""
        self.backgroundImageView = nil
    }
    
    
}
