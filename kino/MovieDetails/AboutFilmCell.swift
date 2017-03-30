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
        self.runtimeLabel.text = String(describing:self.item.runtime)
        self.budgetLabel.text = String(describing:self.item.budget)
        self.revenuelabel.text = String(describing:self.item.revenue)
        self.homepagelabel.text = self.item.homepage
    }
    
    
    


}
