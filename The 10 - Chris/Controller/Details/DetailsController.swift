//
//  DetailsControlelr.swift
//  The 10 - Chris
//
//  Created by christopher downey on 2/16/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import UIKit

class DetailsController: UIViewController {
    
    var movie: Movie!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    // MARK - free up selected movie
    override func viewWillDisappear(_ animated: Bool) {
        DataManager.shared.clearSelectedMovie()
    }
    
    private func configure() {
        
        if let movie = DataManager.shared.selectedMovie {
            self.movie = movie
        }
        
        let details = DetailsView(frame: view.bounds)
        view.addSubview(details)
        
        details.backdrop.downloadImage(imageType: ImageType.backdrop, path: movie.backdropPath ?? "")
        details.setViewData(for: movie)
    }
}
