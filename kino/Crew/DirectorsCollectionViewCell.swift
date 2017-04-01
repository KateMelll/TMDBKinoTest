//
//  DirectorsCollectionViewCell.swift
//  kino
//
//  Created by K on 01/04/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class DirectorsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!

    var item: MTDirectors! {
        didSet {
            self.setInfo()
        }
    }
    
    private func setInfo() {
        self.nameLabel.text = self.item.name
        self.jobLabel.text = self.item.job
    }
    
}
