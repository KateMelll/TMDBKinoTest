//
//  MoviesCollectionViewController.swift
//  kino
//
//  Created by Kate on 29/03/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

private let reuseIdentifier = "MoviesCollectionViewCell"

class MoviesCollectionViewController: UICollectionViewController {

    var movies = [MTMovie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadMovies()
    }

    func loadMovies() {
        let request =  MTMoviesRequest()
        MTNetwork.makeRequest(request: request) { (response: MTMoviesResponse?, error: Error?) in
            if let response = response {
                self.movies.removeAll()
                self.movies.append(contentsOf: response.results)
                self.collectionView!.reloadData()
            }
        }
    }
    
    func item(at indexPath: IndexPath) -> MTMovie {
        return self.movies[indexPath.row]
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.movies.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MoviesCollectionViewCell
        cell.item = self.item(at: indexPath)
        return cell
    }

    // MARK: UICollectionViewDelegate
    
    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
