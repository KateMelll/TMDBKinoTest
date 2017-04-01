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
            authorCell.item = self.movieDetails!
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
    
    // MARK: - Other

}

 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


