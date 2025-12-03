//
//  AppData.swift
//  Gallery
//
//  Created by Batiste Vancoillie on 03/12/2025.
//

import Foundation
import Observation

@Observable
class AppData {
    var galleryData =  GalleryData()
    var selectedGallery: Gallery?
    
    // MARK: - Find helpers
        
        func findArtist(id: String) -> Artist? {
            galleryData.galleries
                .flatMap(\.artists)
                .first(where: { $0.id == id })
        }
        
        func findArtwork(id: String) -> Artwork? {
            for gallery in galleryData.galleries {
                for artist in gallery.artists {
                    if let artwork = artist.artworks.first(where: { $0.artworkID == id }) {
                        return artwork
                    }
                }
            }
            return nil
        }
        
        /// Finds the artist that owns the given artwork.
        func findArtist(for artwork: Artwork) -> Artist? {
            for gallery in galleryData.galleries {
                if let artist = gallery.artists.first(where: { artist in
                    artist.artworks.contains(where: { $0.artworkID == artwork.artworkID })
                }) {
                    return artist
                }
            }
            return nil
        }
}
