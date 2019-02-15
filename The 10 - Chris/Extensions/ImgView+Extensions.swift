//
//  Extensions+ImgView.swift
//  The 10 - Chris
//
//  Created by christopher downey on 2/14/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import UIKit

// MARK - download movie image or assign default image if none
extension ScaleImageView {
    static var cache: [URL: UIImage] = [:]
    
    func downloadImage(imageType: ImageType, path: String) {
        let defaultImage = #imageLiteral(resourceName: "no poster")
        guard let url = URL(string: imageType.rawValue + path) else {
            print("failed url")
            self.image = defaultImage
            return
            
        }
        
        self.url = url
        
        if let image = ScaleImageView.cache[url] {
            self.image = image
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let imageData = data, let img = UIImage(data: imageData) {
                
                DispatchQueue.main.async {
                    if img.size.width > 500 {
                        print("Big image!")
                    }
                    ScaleImageView.cache[url] = img
                    
                    if self?.url == url {
                        self?.image = img
                    }
                    return
                }
            }
        }
        
        task.resume()
    }
}

// MARK - to set appropriate star (color) for movie rating
extension UIImageView {
    func setStarRating(with rating: Double) {
        var star = #imageLiteral(resourceName: "Home Yellow Star-1")
        if rating < 4 {
            star = #imageLiteral(resourceName: "Home Red Star-1")
        } else if rating > 7 {
            star = #imageLiteral(resourceName: "Home Green Star-1")
        }
        self.image = star
    }
}