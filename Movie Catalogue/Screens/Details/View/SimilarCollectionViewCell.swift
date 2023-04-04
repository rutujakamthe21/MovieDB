//
//  SimilarCollectionViewCell.swift
//  Movie Catalogue
//
//  Created by Neosoft on 31/03/23.
//

import UIKit

class SimilarCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var data: Output? {
        didSet {
            configureCell()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configureCell() {
        imageView.setImage(with: Constant.API.POSTER_URL + (data?.posterPath ?? ""))
    }
}
