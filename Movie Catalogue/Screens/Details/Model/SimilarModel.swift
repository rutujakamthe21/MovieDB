//
//  SimilarModel.swift
//  Movie Catalogue
//
//  Created by Neosoft on 30/03/23.
//
//   let similar = try? JSONDecoder().decode(Similar.self, from: jsonData)

import Foundation

// MARK: - Similar
struct Similar: Codable {
    let page: Int
    let results: [Output]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Output
struct Output: Codable {
    let adult: Bool
    let backdropPath: String?
    let genreIDS: [Int]
    let id: Int
    let originalLanguage: OriginalLan
    let originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

enum OriginalLan: String, Codable {
    case en = "en"
    case fr = "fr"
    case da = "da"
    case de = "de"
    case es = "es"
    case zh = "zh"
    case sv = "sv"
    case it = "it"
    case ru = "ru"
    case ja = "ja"
    case mn = "mn"
    case nl = "nl"
    case cs = "cs"
    case ko = "ko"
    case cn = "cn"
    case pl = "pl"
    case el = "el"
    case pt = "pt"
    case fi = "fi"
    case tl = "tl"
    case no = "no"
    case xx = "xx"
    case mo = "mo"
    case ml = "ml"
}
