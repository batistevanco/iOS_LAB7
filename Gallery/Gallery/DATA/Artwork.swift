//
//  Artwork.swift
//  Galleries
//
//  Created by Dirk Hostens on 02/09/2024.
//

import Foundation

struct Artwork: Identifiable, Codable, Hashable, Equatable {
    var id: String { artworkID }
    let artworkID: String
    let title: String
    let year: Int
    let medium: String
    let dimensions: String
    let imageLink: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case artworkID = "artwork_id"
        case title, year, medium, dimensions, imageLink = "image_link", description
    }
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
