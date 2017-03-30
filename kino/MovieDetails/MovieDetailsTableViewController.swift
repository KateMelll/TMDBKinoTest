//
//  MovieDetailsTableViewController.swift
//  kino
//
//  Created by Kate on 30/03/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import Alamofire

enum CellKind: Int {
    case Header = 0
    case Plot = 1
    case Author = 2
    case Actor = 3
    case AboutFilm = 4
    case Other = 5
}

class MovieDetailsTableViewController: UITableViewController {

    
    var movie: MTMovie!
    var movieDetails: MTMovieDetails!
    var cellsKinds = 6
    private let animationFadeInDuration: TimeInterval = 0.3

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureController()
        self.loadDetails()
    }
    
    func loadDetails() {
        if let id = self.movie.id {
            let request = MTMovieDetailsRequest(id: id)
            MTNetwork.makeRequest(request: request) { (response: MTMovieDetails?, error: Error?) in
                if let response = response {
                    print("RESPON \(response)")
                    self.movieDetails = response
                    self.tableView.reloadData()
                    print("self.movieDetails \(self.movieDetails)")
                }
                else {
                    print("Could not unwrap optional MTMovieDetails")
                }
            }
        }
    }

    private func configureController() {
        
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableViewAutomaticDimension
        
//        self.title = "movies.nav.title".localize
    }

    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cellsKinds
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == CellKind.Header.rawValue {
            let headerCell = tableView.dequeueReusableCell(withIdentifier: String(describing: HeaderCell.self), for: indexPath) as! HeaderCell
            headerCell.item = self.movieDetails
            print("item \(headerCell.item)")
            return headerCell
        }
        if indexPath.row == CellKind.Plot.rawValue {
            let plotCell = tableView.dequeueReusableCell(withIdentifier: String(describing: PlotCell.self), for: indexPath) as! PlotCell
            plotCell.item = self.movieDetails
            return plotCell
        }
        if indexPath.row == CellKind.Author.rawValue {
            let authorCell = tableView.dequeueReusableCell(withIdentifier: String(describing: AuthorCell.self), for: indexPath) as! AuthorCell
            authorCell.item = self.movieDetails
            return authorCell
        }
        if indexPath.row == CellKind.Actor.rawValue {
            let actorCell = tableView.dequeueReusableCell(withIdentifier: String(describing: ActorCell.self), for: indexPath) as! ActorCell
            actorCell.item = self.movieDetails
            return actorCell
        }
        if indexPath.row == CellKind.AboutFilm.rawValue {
            let aboutCell = tableView.dequeueReusableCell(withIdentifier: String(describing: AboutFilmCell.self), for: indexPath) as! AboutFilmCell
            aboutCell.item = self.movieDetails
            return aboutCell
        } else {
            let other = tableView.dequeueReusableCell(withIdentifier: String(describing: OtherCell.self), for: indexPath) as! OtherCell
            other.item = self.movieDetails
            return other
        }
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

}
