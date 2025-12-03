import SwiftUI
import Observation

struct ContentView: View {

    @Environment(AppData.self) var appData

    var body: some View {
        TabView {
            GalleryView()
                .tabItem {
                    Label("Galleries", systemImage: "photo.on.rectangle")
                }

            GalleryDetailTab()
                .tabItem {
                    Label("No gallery", systemImage: "photo")
                }
        }
    }
}
