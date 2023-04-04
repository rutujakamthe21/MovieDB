//
//  ReviewsCell.swift
//  Movie Catalogue
//
//  Created by Neosoft on 31/03/23.
//

import UIKit

class ReviewsCell: UITableViewCell {
    
    @IBOutlet weak var reviewTableview: UITableView!
    var isReviewAll = false
    var reviewsData: Reviews? {
        didSet {
            reviewTableview.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        reviewTableview.delegate = self
        reviewTableview.dataSource = self
        reviewTableview.register(UINib(nibName: "ReviewTableViewCell", bundle: nil), forCellReuseIdentifier: "ReviewTableViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }    
}

extension ReviewsCell: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        reviewsData?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewTableViewCell") as? ReviewTableViewCell else {
            return UITableViewCell()
        }
        cell.data = reviewsData
        return cell
    }
}
