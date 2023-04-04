//
//  MovieCell.swift
//  MovieCell Catalogue
//
//  Created by Neosoft on 28/03/23.
//

import UIKit

class MovieCell: UITableViewCell {
    
    //MARK: Outlets
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var votesLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    
    var movieResults: Results? {
        didSet {
            movieResultsDetailConfiguration()
        }
    }

    //MARK: View Controller Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.clipsToBounds       = false
        bgView.layer.cornerRadius  = 5
        bgView.backgroundColor     = .systemGray6
        bgView.layer.shadowColor   = UIColor.gray.cgColor
        bgView.layer.shadowOpacity = 0.3
        bgView.layer.shadowOffset  = .zero
        bgView.layer.shadowRadius  = 10
        
        movieImage.layer.cornerRadius = 5
    }
    
    override func layoutSubviews() {
        movieTitleLabel.sizeToFit()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func movieResultsDetailConfiguration() {
        guard let movieResults else {
            return
        }
        movieTitleLabel.text = movieResults.originalTitle
        dateLabel.text = movieResults.releaseDate
        votesLabel.text = String(movieResults.voteCount)
        rateLabel.text = "Rate: \(String(movieResults.voteAverage))/10"
        movieImage.setImage(with: Constant.API.POSTER_URL + movieResults.posterPath)
    }
}
