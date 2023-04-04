//
//  DetailViewModel.swift
//  Movie Catalogue
//
//  Created by Neosoft on 30/03/23.
//

import Foundation

final class DetailViewModel {
    var detail : Detail?
    var reviews: Reviews?
    var credits: Credits?
    var similar: Similar?
//    var startLoding: (() -> Void)?
//    var stoptLoding: (() -> Void)?
//    var id: Int?
    var eventHandler: ((_ event: Event) -> Void)?
    
    init(movieID: Int) {
        fetchDetails(id: movieID)
    }
    
    func fetchDetails(id: Int) {
        let dispatchGroup = DispatchGroup()
//        startLoding?()
        dispatchGroup.enter()
        self.eventHandler?(.loading)
        APIManager.shared.request(modelType: Detail.self, urlString: EndPointItems.requestedURL(endPoint: .details(id))) { response in
            self.eventHandler?(.stopLoading)
            switch response {
            case .success(let details):
                self.detail = details
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                self.eventHandler?(.error(error))
            }
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        self.eventHandler?(.loading)
        APIManager.shared.request(modelType: Reviews.self, urlString: EndPointItems.requestedURL(endPoint: .reviews(id))) { response in
            self.eventHandler?(.stopLoading)
            switch response {
            case .success(let reviews):
                self.reviews = reviews
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                self.eventHandler?(.error(error))
            }
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        self.eventHandler?(.loading)
        APIManager.shared.request(modelType: Credits.self, urlString: EndPointItems.requestedURL(endPoint: .credits(id))) { response in
            self.eventHandler?(.stopLoading)
            switch response {
            case .success(let credits):
                self.credits = credits
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                self.eventHandler?(.error(error))
            }
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        self.eventHandler?(.loading)
        APIManager.shared.request(modelType: Similar.self, urlString: EndPointItems.requestedURL(endPoint: .similar(id))) { response in
            self.eventHandler?(.stopLoading)
            switch response {
            case .success(let similar):
                self.similar = similar
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                self.eventHandler?(.error(error))
            }
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
//            self.stoptLoding?()
            print("Data Loaded")
        }
    }
}

extension DetailViewModel {
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
}
