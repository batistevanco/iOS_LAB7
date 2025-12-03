//
//  GalleryView.swift
//  Gallery
//
//  Created by Batiste Vancoillie on 03/12/2025.
//

import SwiftUI

struct GalleryView: View {
    
    @Environment(AppData.self) var appData
    @State private var loading = true

    var body: some View {
        ScrollView{
            Group{
                if loading{
                    ProgressView("Loading...")
                }else{
                    VStack(alignment: .leading, spacing: 32){
                        ForEach(appData.galleryData.galleries) { gallery in
                            VStack(alignment: .center){
                                Text(gallery.name)
                                    .font(.title2.bold())
                                    .foregroundColor(Color.brown)

                                Text(gallery.location)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)

                                Text(gallery.description)
                                    .font(.body)
                                    .lineLimit(3)
                                    .multilineTextAlignment(.center)
                            }.onTapGesture {
                                appData.selectedGallery = gallery
                            }
                        }
                    }
                }
            }.task{
                await appData.galleryData.loadData()
                loading = false
            }
            
        }
    }
}


