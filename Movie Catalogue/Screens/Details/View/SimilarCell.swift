//
//  SimilarCell.swift
//  Movie Catalogue
//
//  Created by Neosoft on 03/04/23.
//

import UIKit

class SimilarCell: UITableViewCell {
    
    @IBOutlet weak var similarCollectionView: UICollectionView!
    
    var similarData: Similar? {
        didSet {
            similarCollectionView.reloadData()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        similarCollectionView.delegate = self
        similarCollectionView.dataSource = self
        similarCollectionView.register(UINib(nibName: "SimilarCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SimilarCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension SimilarCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return similarData?.results.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = similarCollectionView.dequeueReusableCell(withReuseIdentifier: "SimilarCollectionViewCell", for: indexPath) as? SimilarCollectionViewCell else {
            return UICollectionViewCell()
        }
        if let similarResult = similarData?.results[indexPath.row] {
            cell.data = similarResult
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CGFloat((collectionView.frame.size.width / 2.0) - 50), height: CGFloat(150))
    }
}
