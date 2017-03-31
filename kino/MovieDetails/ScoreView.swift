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
    
    let secondColor = UIColor.blue
    var progress: CGFloat = 0
    
    override func draw(_ rect: CGRect) {
        let color = UIColor(hexString: "F96767")
        let center = CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2)
        let radius: CGFloat = min(bounds.width + 5, bounds.height + 5)
        let arcWidth: CGFloat = 75
        let start: CGFloat = 0
        let end: CGFloat = (2 * CGFloat(M_PI))
        let path = UIBezierPath(arcCenter: center, radius: radius / 2 - arcWidth / 2, startAngle: start, endAngle: end, clockwise: true)
        path.lineWidth = 2
        color!.setStroke()
        path.stroke()
    

    
    let customCenter = CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2)
    let customRadius: CGFloat = min(bounds.width + 5, bounds.height + 5)
    let carcWidth: CGFloat = 75
    let cstart: CGFloat = 0
    let cend: CGFloat = progress * (2 * CGFloat(M_PI))
    let cpath = UIBezierPath(arcCenter: customCenter, radius: customRadius / 2 - carcWidth / 2, startAngle: cstart, endAngle: cend, clockwise: true)
    cpath.lineWidth = 2
    secondColor.setStroke()
    cpath.stroke()

    }

}
