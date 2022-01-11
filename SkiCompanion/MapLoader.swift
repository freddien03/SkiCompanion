//
//  MapLoader.swift
//  SkiCompanion
//
//  Created by Nunn, Frederick (IRG) on 26/11/2021.
//

import Foundation
import SwiftUI

class MapLoader: ObservableObject {
    @Published var image: UIImage = UIImage()
    
    func loadImage(for urlString: String) {
        // makes sure url is in correct format
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return } // checks data is returned
            DispatchQueue.main.async {
                // updates image variable with retrieved image, or an empty image if else
                self.image = UIImage(data: data) ?? UIImage()
            }
        }
        task.resume()
    }
}
