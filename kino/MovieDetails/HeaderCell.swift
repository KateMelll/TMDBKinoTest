//
//  HeaderCell.swift
//  kino
//
//  Created by Kate on 30/03/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import SDWebImage
import SwiftHexColor

class HeaderCell: UITableViewCell {

    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblYear: UILabel!
    @IBOutlet weak var lblAgeLimit: UILabel!
    @IBOutlet weak var scoreBgView: ScoreView!
    @IBOutlet weak var scoreView: ScoreView!
    @IBOutlet weak var voteAvrgLabel: UILabel!
    
    let generalTime: Double = 0.25
    var temp: Double = 0.25
    var timer: Timer!
    private let animationFadeInDuration: TimeInterval = 0.3
    
    deinit {
        self.timer.invalidate()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.timer.invalidate()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func startTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.updateScoreView), userInfo: nil, repeats: true)
    }
    
    
    func updateScoreView() {
        self.temp = self.temp - 0.01
        self.scoreView.progress = CGFloat(1 - temp / generalTime)
        if temp < 0 {
            self.timer.invalidate()
        }
    }
    
    var item: MTMovieDetails! {
        didSet {
            self.setInfo()
            self.scoreBgView.progress = 1
            self.startTimer()
        }
    }
    
    private func setInfo() {
        let url = URL(string: Constants.Server.imagesRootPath() + self.item.poster_path)
        self.posterView.sd_setImage(with: url)
        self.lblTitle.text = self.item.title
        let backUrl = URL(string: Constants.Server.imagesRootPath() + self.item.backdrop_path)
        self.backdropView.sd_setImage(with: backUrl)
        let voteAvrg = self.item.vote_average!
        let score = (voteAvrg * 100) / 10
        self.scoreBgView.color = UIColor.gray
        if score < 50 {
            self.scoreView.color = UIColor(hexString: "D81313")!
        } else if score < 70 {
            self.scoreView.color = UIColor(hexString: "DAE723")!
        } else {
            self.scoreView.color = UIColor(hexString:"0DDE67")!
        }
        self.voteAvrgLabel.text = String(describing: Int(score))
        let year = self.getYear(from: self.item.release_date)
        self.lblYear.text = year
        self.lblAgeLimit.text = self.item.cert
    }

    func getYear(from date: String) -> String {
        return date.components(separatedBy: "-").first!
    }
    
}
