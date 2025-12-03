import SwiftUI
import Observation

struct ArtistView: View {
    @Environment(PathStore.self) private var pathStore
    @Environment(AppData.self) var appData
    let artist: Artist

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {

                VStack(alignment: .leading, spacing: 8) {
                    Text(artist.name)
                        .font(.largeTitle.bold())
                    Text("\(artist.nationality) · \(artist.style)")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }

                Text(artist.description)
                    .font(.body)

                Divider()

                Text("Artworks")
                    .font(.title3.bold())

                ForEach(artist.artworks) { artwork in
                    NavigationLink(value: Route.Artwork(artwork)){
                        VStack(alignment: .leading, spacing: 4) {
                            Text(artwork.title)
                                .font(.headline)
                            Text("\(artwork.year) – \(artwork.medium)")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        .padding(.vertical, 4)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .contentShape(Rectangle())
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
        .navigationTitle(artist.name)
    }
}
