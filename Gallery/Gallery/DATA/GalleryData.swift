//
//  GalleryData.swift
//  Gallery
//
//  Created by Batiste Vancoillie on 03/12/2025.
//
import Observation


@Observable
class GalleryData {

    //...
    var galleries: [Gallery] = []

    func loadData() async {
        // TODO: Implement async loading
        do {
            print("⏳ Simulating 2-second load delay...")
            try await Task.sleep(for: .seconds(2)) // Simulate long load
            //load galleries here
            let loaded: Galleries = load("galleries.json")
            galleries = loaded.galleries
            print("✅ Data loaded successfully.")
        } catch {
            print("❌ Failed to load galleries:", error)
            galleries = []
        }
    }
}
