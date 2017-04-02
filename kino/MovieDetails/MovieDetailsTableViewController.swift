//
//  MovieDetailsTableViewController.swift
//  kino
//
//  Created by Kate on 30/03/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import Alamofire

enum Cell: Int {
    case Header
    case Plot
    case Author
    case Actor
    case AboutFilm
    case Total
}

class MovieDetailsTableViewController: UITableViewController {


    var movie: MTMovie!
    var movieDetails: MTMovieDetails!
    var movieCastResponse: MTCastResponse!

    private let animationFadeInDuration: TimeInterval = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureController()
        self.loadDetails()
    }
    
    func loadDetails() {
        let request = MTMovieDetailsRequest(id: self.movie.id!)
        MTNetwork.makeRequest(request: request) { (response: MTMovieDetails?, error: Error?) in
            if let response = response {
                self.movieDetails = response
                
                let request = MTMovieReleasesRequest(id: self.movie.id!)
                MTNetwork.makeRequest(request: request) { (response: MTReleaseDateResultsResponse?, error: Error?) in
                    if let response = response {
                        for release in response.results {
                            if release.iso.lowercased() == "US".lowercased() {
                                self.movieDetails.cert = release.date.first?.certification
                            }
                        }
                    }
                    else {
                        print("Could not unwrap optional MTMovieDetails")
                    }
                    
                    let request = MTMovieCastRequest(id: self.movie.id!)
                    MTNetwork.makeRequest(request: request) { (response: MTCastResponse?, error: Error?) in
                        if let response = response {
                            self.movieCastResponse = response
                        }
                        else {
                            print("Could not unwrap optional MTMovieDetails")
                        }
                        self.tableView.reloadData()
                        
                    }
                }
            }
            else {
                print("Could not unwrap optional MTMovieDetails")
            }
        }
    }

    
    private func configureController() {
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let _ = self.movieDetails {
            return Cell.Total.rawValue
        }
        else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == Cell.Header.rawValue {
            let headerCell = tableView.dequeueReusableCell(withIdentifier: String(describing: HeaderCell.self), for: indexPath) as! HeaderCell
            headerCell.item = self.movieDetails!
            return headerCell
        }
        if indexPath.row == Cell.Plot.rawValue {
            let plotCell = tableView.dequeueReusableCell(withIdentifier: String(describing: PlotCell.self), for: indexPath) as! PlotCell
            plotCell.item = self.movieDetails!
            return plotCell
        }
        if indexPath.row == Cell.Author.rawValue {
            let authorCell = tableView.dequeueReusableCell(withIdentifier: String(describing: AuthorCell.self), for: indexPath) as! AuthorCell
            authorCell.item = self.movieCastResponse!
            return authorCell
        }
        if indexPath.row == Cell.Actor.rawValue {
            let actorCell = tableView.dequeueReusableCell(withIdentifier: String(describing: ActorCell.self), for: indexPath) as! ActorCell
            actorCell.item = self.movieCastResponse!
            return actorCell
        }
        else {
            let aboutCell = tableView.dequeueReusableCell(withIdentifier:String(describing: AboutFilmCell.self), for: indexPath) as!AboutFilmCell
            aboutCell.item = self.movieDetails!
            return aboutCell
            }
        }
}
