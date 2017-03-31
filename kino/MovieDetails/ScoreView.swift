//
//  ScoreView.swift
//  kino
//
//  Created by Kate on 31/03/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import SwiftHexColor

class ScoreView: UIView {
    
    var color = UIColor.black
    var progress: CGFloat = 0 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        let center = CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2)
        let radius: CGFloat = min(bounds.width + 5, bounds.height + 5)
        let arcWidth: CGFloat = 75
        let start: CGFloat = 0
        let end: CGFloat = progress * (2 * CGFloat(M_PI))
        let path = UIBezierPath(arcCenter: center, radius: radius / 2 - arcWidth / 2, startAngle: start, endAngle: end, clockwise: true)
        path.lineWidth = 2
        self.color.setStroke()
        path.stroke()
    }

}
