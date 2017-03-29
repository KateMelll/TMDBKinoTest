//
//  MoviesCollectionViewCell.swift
//  kino
//
//  Created by Kate on 29/03/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import AlamofireImage

class MoviesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    private let animationFadeInDuration: TimeInterval = 0.3

    var item: MTMovie! {
        didSet {
            self.setImage(item.poster_path, left: false)
        }
    }
    
    private func setImage(_ urlPathString: String?, left: Bool) {
        guard urlPathString != nil else {
            return
        }
        if let url = URL(string: Constants.Server.imagesRootPath() + urlPathString!) {
            self.posterImageView.af_setImage(withURL: url,
                                             placeholderImage: nil,
                                             filter: nil,
                                             progress: nil,
                                             progressQueue: DispatchQueue.main,
                                             imageTransition: UIImageView.ImageTransition.crossDissolve(animationFadeInDuration),
                                             runImageTransitionIfCached: true,
                                             completion: nil)
        }
        
    }

}
