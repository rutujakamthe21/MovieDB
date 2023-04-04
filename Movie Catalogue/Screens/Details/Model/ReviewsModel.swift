//
//  ReviewsModel.swift
//  Movie Catalogue
//
//  Created by Neosoft on 30/03/23.
//
//   let reviews = try? JSONDecoder().decode(Reviews.self, from: jsonData)

import Foundation

// MARK: - Reviews
struct Reviews: Codable {
    let id, page: Int
    let results: [Outcome]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case id, page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Outcome
struct Outcome: Codable {
    let author: String
    let authorDetails: AuthorDetails
    let content, createdAt, id, updatedAt: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case author
        case authorDetails = "author_details"
        case content
        case createdAt = "created_at"
        case id
        case updatedAt = "updated_at"
        case url
    }
}

// MARK: - AuthorDetails
struct AuthorDetails: Codable {
    let name, username, avatarPath: String
    let rating: Int

    enum CodingKeys: String, CodingKey {
        case name, username
        case avatarPath = "avatar_path"
        case rating
    }
}
