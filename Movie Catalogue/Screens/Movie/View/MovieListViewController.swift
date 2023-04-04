//
//  MovieListViewController.swift
//  Movie Catalogue
//
//  Created by Neosoft on 28/03/23.
//

import UIKit

class MovieListViewController: UIViewController {
    
    @IBOutlet weak var movieTableView: UITableView!
    
    private var viewModel = MovieViewModel()
//    private var detailVM  = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        initViewModel()
    }
}

extension MovieListViewController {
    
    func configuration() {
        movieTableView.register(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: "MovieCell")
        customNavigation()
        observeEvent()
    }
    
    func customNavigation() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 95/255, green: 75/255, blue: 145/255, alpha: 1.0)
        
        /// setup title font color
        let titleAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .bold), NSAttributedString.Key.foregroundColor: UIColor.white]
        appearance.titleTextAttributes = titleAttribute
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
    }
    
    func initViewModel() {
        viewModel.fetchMovies()
    }
    
    ///Event for data binding
    func observeEvent() {
        viewModel.eventHandler = { [weak self] event in
            guard let self else {
                return
            }
            switch event {
            case .loading: break
            case .stopLoading: break
            case .dataLoaded:
                DispatchQueue.main.async {
                    self.movieTableView.reloadData()
                }
            case .error(let error):
                print(error!)
            }
        }
    }
    
    func openDetail(movieID: Int) {
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        let vm = DetailViewModel(movieID: movieID)
        detailVC.detailViewModel = vm
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}

extension MovieListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as? MovieCell else {
            return UITableViewCell()
        }
        let movie = viewModel.movies?.results[indexPath.row]
        cell.movieResults = movie
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieID = viewModel.movies?.results[indexPath.row].id
        self.openDetail(movieID: movieID!)
    }
}
