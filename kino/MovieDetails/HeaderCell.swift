//
//  HeaderCell.swift
//  kino
//
//  Created by Kate on 30/03/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import AlamofireImage

class HeaderCell: UITableViewCell {

    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblYear: UILabel!
    @IBOutlet weak var lblAgeLimit: UILabel!
    
    private let animationFadeInDuration: TimeInterval = 0.3

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    var item: MTMovieDetails! {
        didSet {
            self.setInfo()
        }
    }
    
    private func setInfo() {
        self.setImage(self.item.poster_path, left: false)
//        self.posterView.af_setImage(withURL: url!)
        self.lblTitle.text = self.item.title
        self.setBackImage(self.item.backdrop_path, left: false)
//        self.lblYear.text = self.item.
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

    
    private func setBackImage(_ urlPathString: String?, left: Bool) {
        
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
