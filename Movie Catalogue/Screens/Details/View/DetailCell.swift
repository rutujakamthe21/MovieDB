//
//  DetailTableViewCell.swift
//  Movie Catalogue
//
//  Created by Neosoft on 30/03/23.
//

import UIKit

class DetailCell: UITableViewCell {
    
    @IBOutlet weak var backgroundImg: UIImageView!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var detailResults: Detail? {
        didSet {
            DetailConfiguration()
        }
    }
    var movieType = [String]()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundImg.layer.cornerRadius = 5
        posterImage.layer.borderWidth = 1.5
        posterImage.layer.borderColor = UIColor.lightGray.cgColor
        descriptionTextView.textColor = UIColor(named: "label_color")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func DetailConfiguration() {
        guard let detailResults else {
            return
        }
        backgroundImg.setImage(with: Constant.API.POSTER_URL + detailResults.backdropPath)
        posterImage.setImage(with: Constant.API.POSTER_URL + detailResults.posterPath)
        titleLabel.text = detailResults.title
        ratingLabel.text = "\(String(detailResults.voteAverage))/10"
        dateLabel.text = detailResults.releaseDate
        descriptionTextView.text = detailResults.overview
        for genre in detailResults.genres {
            movieType.append(genre.name)
        }
        typeLabel.text = movieType.joined(separator: ", ")
    }
    
}
