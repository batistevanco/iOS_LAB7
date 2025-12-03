
//
//  Gallery
//
//  Created by Batiste Vancoillie on 03/12/2025.
//


import SwiftUI

struct ArtworkView: View {

    @Environment(AppData.self) private var appData
    @Environment(PathStore.self) private var pathStore

    let artwork: Artwork

    private var artist: Artist? {
        appData.findArtist(for: artwork)
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {

                VStack(alignment: .leading, spacing: 8) {
                    Text(artwork.title)
                        .font(.largeTitle.bold())

                    Text("\(artwork.year)")
                        .font(.title3)
                        .foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 4) {
                    Text("Medium: \(artwork.medium)")
                    Text("Dimensions: \(artwork.dimensions)")
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)

                if let url = URL(string: artwork.imageLink) {
                    Link("View image online", destination: url)
                        .font(.footnote)
                }

                Text(artwork.description)
                    .font(.body)

                Divider()

                if let artist {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Artist")
                            .font(.title3.bold())

                        NavigationLink(value: Route.Artist(artist)) {
                            Text(artist.name)
                                .font(.headline)
                                .foregroundStyle(.primary)
                        }
                    }

                    Divider()

                    let others = artist.artworks.filter { $0.artworkID != artwork.artworkID }

                    if !others.isEmpty {
                        Text("Other artworks by \(artist.name)")
                            .font(.title3.bold())

                        ForEach(others) { other in
                            NavigationLink(value: Route.Artwork(other)) {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(other.title)
                                        .font(.headline)

                                    Text("\(other.year) – \(other.medium)")
                                        .font(.subheadline)
                                        .foregroundStyle(.secondary)
                                }
                                .padding(.vertical, 4)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .contentShape(Rectangle())
                        }
                    }
                }

                Divider()

                Button("Clear Navigation Path") {
                    pathStore.path.removeAll()
                }
                .padding(.top, 10)
            }
            .padding()
        }
        .navigationTitle(artwork.title)
    }
}
