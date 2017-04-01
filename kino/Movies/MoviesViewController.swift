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
    var collectionViewController: MoviesCollectionViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateTitle()
        self.updateMode()
        self.segmentedCotrlView.addTarget(self, action: #selector(self.segmentChanged), for: .valueChanged)
        self.segmentedCotrlView.backgroundColor = .white
    }

    func segmentChanged(sender: UISegmentedControl) {
        self.updateTitle()
        self.updateMode()
        self.collectionViewController.collectionView?.scrollToItem(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
    }

    func updateTitle() {
        self.navigationItem.title = self.segmentedCotrlView.titleForSegment(at: self.segmentedCotrlView.selectedSegmentIndex)
    }
    
    func updateMode() {
        self.collectionViewController.mode = self.mode(for: self.segmentedCotrlView.selectedSegmentIndex)
        self.collectionViewController.loadMovies()
    }
    
    func mode(for index: Int) -> Mode {
        switch index {
        case 0:
            return .Popular
        case 1:
            return .Upcoming
        default:
            return .Top
        }
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MoviesCollectionViewController" {
            let destController = segue.destination as! MoviesCollectionViewController
            destController.moviesViewController = self
            self.collectionViewController = destController
        }
    }
}
