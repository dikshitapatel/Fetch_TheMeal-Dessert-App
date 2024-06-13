//
//  RemoteImageLoader.swift
//  Fetch_TheMeal Dessert
//
//  Created by Dikshita Rajendra Patel on 13/06/24.
//

import Foundation
import SwiftUI
class RemoteImageLoader: ObservableObject {
    @Published var image: UIImage?
    
    func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error loading image: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }.resume()
    }
}
