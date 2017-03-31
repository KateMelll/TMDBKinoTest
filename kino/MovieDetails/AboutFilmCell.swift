//
//  AboutFilmCell.swift
//  kino
//
//  Created by Kate on 30/03/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class AboutFilmCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var originalLangLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var budgetLabel: UILabel!
    @IBOutlet weak var revenuelabel: UILabel!
    @IBOutlet weak var homepagelabel: UILabel!
    
    private let animationFadeInDuration: TimeInterval = 0.3
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var item: MTMovieDetails! {
        didSet {
            self.setInfo()
        }
    }
    
    private func setInfo() {
        self.titleLabel.text = self.item.original_title
        self.statusLabel.text = self.item.status
        self.originalLangLabel.text = self.item.original_title
        self.budgetLabel.text = "\(self.item.budget!)"
        self.revenuelabel.text = "\(self.item.revenue!)"
        self.homepagelabel.text = self.item.homepage
        self.setCorrectRuntimeFormat()
    }
    
    private func setCorrectRuntimeFormat() {
        let runtime = self.item.runtime!
        let hour = runtime / 60
        let min = runtime - (hour * 60)
        self.runtimeLabel.text = "\(hour)h. \(min)min."
    }
    


}
