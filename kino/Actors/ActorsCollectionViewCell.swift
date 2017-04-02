//
//  ActorsCollectionViewCell.swift
//  kino
//
//  Created by Kate on 01/04/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import SDWebImage

class ActorsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var actorImageView: UIImageView!
    @IBOutlet weak var actorNameLabel: UILabel!
    @IBOutlet weak var characterLabel: UILabel!
    
    var item: MTActors! {
        didSet {
            self.setInfo()
        }
    }
    
    private func setInfo() {
        if let _ = self.item.profile_path {
            self.actorImageView.sd_setImage(with: URL(string: Constants.Server.imagesRootPath() + self.item.profile_path), placeholderImage: UIImage(named: "Placeholder"))
        }
        self.actorImageView.layer.borderColor = UIColor.white.cgColor
        self.actorImageView.layer.borderWidth = 2
        self.actorImageView.layer.cornerRadius = self.actorImageView.frame.width / 2
        self.actorNameLabel.text = self.item.name
        self.characterLabel.text = self.item.character
    }
}
