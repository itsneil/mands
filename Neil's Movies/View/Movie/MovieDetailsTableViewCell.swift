//
//  MovieDetailsTableViewCell.swift
//  Neil's Movies
//
//  Created by Neil Skinner on 07/11/2018.
//  Copyright © 2018 Neil Skinner. All rights reserved.
//

import UIKit

class MovieDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    static let identifier = "MovieDetailsTableViewCell_Identifier"
    
    func setCell(withModel model: MovieModel) {
        titleLabel.text = model.title
        tagLabel.text = model.tagline
        descriptionLabel.text = model.overview
    }

}
