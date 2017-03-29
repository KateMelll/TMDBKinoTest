//
//  MoviesViewController.swift
//  kino
//
//  Created by Kate on 29/03/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController {

    
    @IBOutlet weak var toolbarView: UIToolbar!
    @IBOutlet weak var segmentedCotrlView: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateTitle()
        self.segmentedCotrlView.addTarget(self, action: #selector(self.segmentChanged), for: .valueChanged)
    }

    func updateTitle() {
        self.navigationItem.title = self.segmentedCotrlView.titleForSegment(at: self.segmentedCotrlView.selectedSegmentIndex)
    }
    
    func segmentChanged(sender: UISegmentedControl) {
        self.updateTitle()
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}
