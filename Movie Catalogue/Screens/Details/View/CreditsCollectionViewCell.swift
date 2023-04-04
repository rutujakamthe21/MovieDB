//
//  CreditsCollectionViewCell.swift
//  Movie Catalogue
//
//  Created by Neosoft on 31/03/23.
//

import UIKit

class CreditsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var data: Cast? {
        didSet {
            cellConfiguration()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        pictureImageView.layer.masksToBounds = true
        pictureImageView.layer.cornerRadius = 33.0
    }

    func cellConfiguration() {
        guard let data else { return }
        nameLabel.text = data.name
        pictureImageView.setImage(with: Constant.API.POSTER_URL + (data.profilePath ?? ""))
    }
}
