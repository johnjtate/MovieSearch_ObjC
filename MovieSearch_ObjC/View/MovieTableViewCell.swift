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
    @IBOutlet weak var summaryTextView: UITextField!

    // MARK: - Properties
    
    var movie: JJTMovie? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        
        guard let movie = movie else { return }
        titleLabel.text = movie.title
        ratingLabel.text = "\(movie.rating)"
        summaryTextView.text = movie.summary
    }
}
