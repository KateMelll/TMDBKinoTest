//
//  ViewController.swift
//  kino
//
//  Created by Admin on 26.03.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import Alamofire

class MoviesTVC: UITableViewController {
    
    var movies: [MTMovie]?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if movies == nil {
            loadMovies()
        }
    }
    
    private func configureController() {
        
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableViewAutomaticDimension
        
        self.title = "movies.nav.title".localize
    }

}

