//
//  OtherCell.swift
//  kino
//
//  Created by Kate on 30/03/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class OtherCell: UITableViewCell {

    private let animationFadeInDuration: TimeInterval = 0.3
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    var item: MTMovieDetails! {
        didSet {
            self.setInfo()
        }
    }
    
    private func setInfo() {
    }
    
    private func setImage(_ urlPathString: String?, left: Bool) {
        
        guard urlPathString != nil else {
            return
        }
        
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
