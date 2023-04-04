//
//  DetailViewController.swift
//  Movie Catalogue
//
//  Created by Neosoft on 30/03/23.
//

import UIKit

class DetailViewController: BaseViewController {
    
    @IBOutlet weak var detailTableView: UITableView!
    var detailViewModel: DetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
    }
    
//    func callBacks() {
//        viewModel?.startLoding = {
//            DispatchQueue.main.async {
//                self.startLoader()
//            }
//        }
//
//        viewModel?.stoptLoding = {
//            DispatchQueue.main.async {
//                self.stopLoader()
//            }
//        }
//    }
}

extension DetailViewController {
    
    func configuration() {
        detailTableView.register(UINib(nibName: "DetailCell",  bundle: nil), forCellReuseIdentifier: "DetailCell")
        detailTableView.register(UINib(nibName: "CreditsCell", bundle: nil), forCellReuseIdentifier: "CreditsCell")
        detailTableView.register(UINib(nibName: "ReviewsCell", bundle: nil), forCellReuseIdentifier: "ReviewsCell")
        detailTableView.register(UINib(nibName: "SimilarCell", bundle: nil), forCellReuseIdentifier: "SimilarCell")
        customNavigation()
    }
    
    func customNavigation() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 95/255, green: 75/255, blue: 145/255, alpha: 1.0)
        
        /// setup title font color
        let titleAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .bold), NSAttributedString.Key.foregroundColor: UIColor.white]
        appearance.titleTextAttributes = titleAttribute
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
    }
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let separator = CALayer()
        separator.backgroundColor = UIColor(named: "separator_color")?.cgColor //UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0).cgColor //UIColor.lightGray.cgColor
        separator.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 8)
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell") as? DetailCell else {
                return UITableViewCell()
            }
            let detail = detailViewModel.detail
            cell.detailResults = detail
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CreditsCell") as? CreditsCell else {
                return UITableViewCell()
            }
            let cast = detailViewModel.credits?.cast
            cell.titleLabel.text = "Cast"
            cell.creditsResults = cast
            cell.layer.addSublayer(separator)
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CreditsCell") as? CreditsCell else {
                return UITableViewCell()
            }
            let crew = detailViewModel.credits?.crew
            cell.titleLabel.text = "Crew"
            cell.creditsResults = crew
            cell.layer.addSublayer(separator)
            cell.collectionView.reloadData()
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewsCell") as? ReviewsCell else {
                return UITableViewCell()
            }
            let reviews = detailViewModel.reviews
            cell.reviewsData = reviews
            cell.layer.addSublayer(separator)
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SimilarCell") as? SimilarCell else {
                return UITableViewCell()
            }
            let similar = detailViewModel.similar
            cell.similarData = similar
            cell.layer.addSublayer(separator)
            return cell
        default:
            return UITableViewCell()
        }
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "CreditsCell") as! CreditsCell
//        // calculate height of the cell based on the content of the UICollectionView
//        cell.layoutIfNeeded()
//        let height = cell.collectionView.contentSize.height
//        return height
//    }
}
