//
//  MovieViewModel.swift
//  Movie Catalogue
//
//  Created by Neosoft on 28/03/23.
//

import Foundation

final class MovieViewModel {
    var movies: Movie?
    var eventHandler: ((_ event: Event) -> Void)?  ///Data Binding Closure
    
    func fetchMovies() {
        self.eventHandler?(.loading)
        APIManager.shared.request(modelType: Movie.self, urlString: EndPointItems.requestedURL(endPoint: .now_playing)) { response in
            self.eventHandler?(.stopLoading)
            switch response {
            case .success(let movies):
                self.movies = movies
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                self.eventHandler?(.error(error))
            }
        }
    }
    
    func getCount() -> Int {
        return movies?.results.count ?? 0
    }
    
    func retriveMovie(with id: Int) -> Results? {
        guard let movie = movies?.results.first(where: {$0.id == id}) else {
            return nil
        }
        return movie
    }
}

extension MovieViewModel {
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
}
