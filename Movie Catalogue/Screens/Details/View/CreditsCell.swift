//
//  CreditsCell.swift
//  Movie Catalogue
//
//  Created by Neosoft on 31/03/23.
//

import UIKit

class CreditsCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var creditsResults: [Cast]? {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName: "CreditsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CreditsCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        
//        let layout = UICollectionViewFlowLayout()
//        layout.minimumInteritemSpacing = 0
//        layout.minimumLineSpacing = 0
//        layout.minimumInteritemSpacing = 10
//        collectionView.collectionViewLayout = layout
        
        collectionView.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
//    func creditsConfiguration() {
//        guard let creditsResults else {
//            return
//        }
//        collectionView.reloadData()
//    }
//    func setCollnData(_ data:[Cast]?){
//        creditsResults = data
//        DispatchQueue.main.async {
//            self.collectionView.reloadData()
//        }
//    }
}

extension CreditsCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return creditsResults?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CreditsCollectionViewCell", for: indexPath) as? CreditsCollectionViewCell else {
            return UICollectionViewCell()
        }
        if let creditsResult = creditsResults?[indexPath.row] {
            cell.data = creditsResult
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CGFloat((collectionView.frame.size.width / 3) - 15), height: CGFloat(110))
    }
}
