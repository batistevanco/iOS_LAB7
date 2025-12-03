//
//  GalleryApp.swift
//  Gallery
//
//  Created by Batiste Vancoillie on 03/12/2025.
//

import SwiftUI

@main
struct GalleryApp: App {
    
    @State var appData = AppData()
    @State var pathStore = PathStore()

    var body: some Scene {
        WindowGroup {
            ContentView().environment(appData).environment(pathStore)
        }
    }
}
