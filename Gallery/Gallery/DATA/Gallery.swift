//
//  Gallery.swift
//  Galleries
//
//  Created by Dirk Hostens on 02/09/2024.
//

import Foundation

struct Gallery: Identifiable, Codable, Hashable, Equatable {
    var id: String { galleryID }
    let galleryID: String
    let name: String
    let location: String
    let website: String
    let description: String
    let artists: [Artist]
    
    enum CodingKeys: String, CodingKey {
        case galleryID = "gallery_id"
        case name, location, website, description, artists
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id.elementsEqual(rhs.id)
    }
}
