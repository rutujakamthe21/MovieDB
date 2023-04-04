//
//  EndPointType.swift
//  Movie Catalogue
//
//  Created by Neosoft on 29/03/23.
//

import Foundation

//enum HTTPMethods: String {
//    case get  = "GET"
//    case post = "POST"
//}

protocol EndPointType {
    var path    : String { get }
    var baseURL : String { get }
//    var url     : URL? { get }
//    var method  : HTTPMethods { get }
}

enum EndPointItems {
    case now_playing
    case details(Int)
    case reviews(Int)
    case similar(Int)
    case credits(Int)
    case search(String)
}

extension EndPointItems: EndPointType {
    
    var baseURL: String {
        return "https://api.themoviedb.org/3/movie"
    }
    
    var apikey: String {
        return "api_key=879c92bf4e71a419ea2e5a0ffd8ce856"
    }
    
    var path: String {
        switch self {
        case .now_playing:
            return "/now_playing?"
        case .details (let id):
            return "/\(id)?"
        case .credits (let id):
            return "/\(id)/credits?"
        case .reviews (let id):
            return "/\(id)/reviews?"
        case .similar (let id):
            return "/\(id)/similar?"
        case .search(let string):
            return ""
        }
    }
    
//    var url: URL? {
//        return URL(string: "\(baseURL)\(movieID)\(path)\(apikey)")
//    }
    
//    var method: HTTPMethods {
//        switch self {
//        case .now_playing:
//            return .get
//        case .details:
//            return .get
//        case .reviews:
//            return .get
//        case .similar:
//            return .get
//        case .credits:
//            return .get
//        }
//    }
    
    static func requestedURL(endPoint: EndPointItems) -> String {
        return "\(endPoint.baseURL)\(endPoint.path)\(endPoint.apikey)"
    }
    
}
      
