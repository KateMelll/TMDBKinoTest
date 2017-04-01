//
//  MoviesToolbar.swift
//  kino
//
//  Created by Kate on 29/03/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import QuartzCore

class MoviesToolbar: UIToolbar {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Shadow
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0.5)
        self.layer.shadowRadius = 1
        self.layer.shadowOpacity = 0.25
        self.layer.shouldRasterize = true
    }
}
