//
//  RemoteImageView.swift
//  Fetch_TheMeal Dessert
//
//  Created by Dikshita Rajendra Patel on 13/06/24.
//

import SwiftUI

struct RemoteImageView: View {
    @ObservedObject var imageLoader: RemoteImageLoader
    private let placeholder: Image
    
    init(url: String, placeholder: Image = Image(systemName: "photo")) {
        self.imageLoader = RemoteImageLoader()
        self.placeholder = placeholder
        self.imageLoader.loadImage(from: url)
    }
    
    var body: some View {
        if let image = imageLoader.image {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fill)
        } else {
            placeholder
                .resizable()
                .aspectRatio(contentMode: .fill)
        }
    }
}
