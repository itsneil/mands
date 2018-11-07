//
//  MovieCollectionTableViewCell.swift
//  Neil's Movies
//
//  Created by Neil Skinner on 07/11/2018.
//  Copyright © 2018 Neil Skinner. All rights reserved.
//

import UIKit

class MovieCollectionTableViewCell: UITableViewCell {

    static let identifier = "MovieCollectionTableViewCell_Identifier"
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func setCell(withModel model: CollectionPartModel) {
            titleLabel.text = model.title
    }

}
