//
//  MTMoviesTVCCell.swift
//  kino
//
//  Created by Admin on 26.03.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import AlamofireImage

class MTMoviesTVCCell: UITableViewCell {
    static let reuseIdentifier = "movieCell"
    
    /// Длительность анимации появления постера
    private let animationFadeInDuration: TimeInterval = 0.3
    
    @IBOutlet private weak var imageViewLeft: UIImageView!
    @IBOutlet private weak var imageViewRight: UIImageView!
    
    var posterPathLeft: String? {
        didSet {
            setImage(posterPathLeft, left: true)
        }
    }
    
    var posterPathRight: String? {
        didSet {
            setImage(posterPathRight, left: false)
        }
    }
    
    /// Установить постер
    private func setImage(_ urlPathString: String?, left: Bool) {
        
        guard urlPathString != nil else {
            return
        }
        
        let imageView = left ? self.imageViewLeft : self.imageViewRight
        imageView?.image = nil
        
        if let url = URL(string: Constants.Server.imagesRootPath() + urlPathString!) {
            
            imageView?.af_setImage(withURL: url,
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
