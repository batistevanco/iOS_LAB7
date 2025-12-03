//
//  Artist.swift
//  Galleries
//
//  Created by Dirk Hostens on 02/09/2024.
//

import Foundation

struct Artist: Identifiable, Codable, Equatable, Hashable {
    var id: String { artistID }
    let artistID: String
    let name: String
    let nationality: String
    let style: String
    let description: String
    let artworks: [Artwork]
    
    enum CodingKeys: String, CodingKey {
        case artistID = "artist_id"
        case name, nationality, style, description, artworks
    }
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
