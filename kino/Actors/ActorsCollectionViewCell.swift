//
//  ActorsCollectionViewCell.swift
//  kino
//
//  Created by K on 01/04/2017.
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
        if let profile_path = self.item.profile_path {
            self.actorImageView.sd_setImage(with: URL(string: profile_path))
        }
        self.actorNameLabel.text = self.item.name
        self.characterLabel.text = self.item.character
    }
}
