//
//  ReviewTableViewCell.swift
//  Movie Catalogue
//
//  Created by Neosoft on 31/03/23.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {

    @IBOutlet weak var reviewsTextView: UITextView!
    
    var data: Reviews? {
        didSet {
            configureCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        reviewsTextView.textColor = UIColor(named: "label_color")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell() {
        reviewsTextView.text = data?.results[0].content
    }
    
}
