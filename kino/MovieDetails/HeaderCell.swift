//
//  HeaderCell.swift
//  kino
//
//  Created by Kate on 30/03/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import SDWebImage

class HeaderCell: UITableViewCell {

    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblYear: UILabel!
    @IBOutlet weak var lblAgeLimit: UILabel!
    @IBOutlet weak var scoreView: ScoreView!
    @IBOutlet weak var voteAvrgLabel: UILabel!
    
    var timer: Timer!
    private let animationFadeInDuration: TimeInterval = 0.3
    

    override func layoutSubviews() {
        super.layoutSubviews()
        self.startTimer()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func startTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.updateScoreView), userInfo: nil, repeats: true)
    }
    
    func updateScoreView() {
        let generalTime: Double = 2
        var temp: Double = 2
        temp = temp - 0.5
        self.scoreView.progress = CGFloat(Double(1 - temp / generalTime))
        if temp < 0 {
            self.timer.invalidate()
        }
    }
    
    var item: MTMovieDetails! {
        didSet {
            self.setInfo()
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
        self.voteAvrgLabel.text = String(describing: Int(score))
        let year = self.getYear(from: self.item.release_date)
        self.lblYear.text = year
        self.lblAgeLimit.text = self.item.cert
    }

    func getYear(from date: String) -> String {
        return date.components(separatedBy: "-").first!
    }
    
}
