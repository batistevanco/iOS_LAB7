//
//  GalleryDetailView.swift
//  Gallery
//
//  Created by Batiste Vancoillie on 03/12/2025.
//

import SwiftUI


struct GalleryDetailView: View {
    @Environment(AppData.self) var appData
    @Environment(PathStore.self) private var pathStore

    let gallery: Gallery

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(gallery.name)
                .font(.largeTitle.bold())

            Text(gallery.location)
                .font(.title3)
                .foregroundStyle(.secondary)

            Text(gallery.description)

            Divider()

            Text("Artists")
                .font(.title3.bold())

            ForEach(gallery.artists) { artist in
                NavigationLink(value: Route.Artist(artist)){
                    Text(artist.name)
                }
            }
        }
        .padding()
        VStack(alignment: .leading, spacing: 8){
            Button("Clear"){
                pathStore.path = []
            }
        }
    }
}
