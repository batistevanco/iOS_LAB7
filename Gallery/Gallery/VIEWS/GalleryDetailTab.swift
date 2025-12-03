//
//  GalleryDetailTab.swift
//  Gallery
//
//  Created by Batiste Vancoillie on 03/12/2025.
//

import SwiftUI


struct GalleryDetailTab: View {
    @Environment(AppData.self) var appData
    @Environment(PathStore.self) var pathStore

    var body: some View {
        @Bindable var pathStore = pathStore

        NavigationStack(path: $pathStore.path) {
            Group {
                if let gallery = appData.selectedGallery {
                    GalleryDetailView(gallery: gallery)
                } else {
                    Text("Select a gallery")
                        .foregroundStyle(.secondary)
                }
            }
            .navigationTitle(appData.selectedGallery?.name ?? "Gallery")
            .navigationDestination(for: Route.self) { route in
                switch route {
                    case let .Artist(artist):
                        ArtistView(artist: artist)
                    case let .Artwork(artwork):
                        ArtworkView(artwork: artwork)
                }
            }
                
            
        }
    }
}
