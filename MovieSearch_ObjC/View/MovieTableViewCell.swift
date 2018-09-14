//
//  MovieTableViewCell.swift
//  MovieSearch_ObjC
//
//  Created by John Tate on 9/14/18.
//  Copyright © 2018 John Tate. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var summaryTextLabel: UILabel!
    
    // MARK: - Properties
    
    var movie: JJTMovie? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        
        guard let movie = movie else { return }
        titleLabel.text = movie.title
        // display the movie rating with two decimals at most
        let stringMovieRating = "\(movie.rating)"
        let roundedMovieRating = stringMovieRating.prefix(4)
        ratingLabel.text = String(roundedMovieRating)
        summaryTextLabel.text = movie.summary
    }
}
