//
//  MoviesTVC+Table.swift
//  kino
//
//  Created by Admin on 26.03.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

extension MoviesTVC {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var moviesCount = movies?.count ?? 0
        if moviesCount % 2 == 1 {
            moviesCount += 1
        }
        return moviesCount / 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MTMoviesTVCCell.reuseIdentifier) as! MTMoviesTVCCell
        
        cell.posterPathLeft = self.movies![indexPath.row*2].poster_path
        
        if indexPath.row*2 + 1 < movies!.count {
            cell.posterPathRight = self.movies![indexPath.row*2 + 1].poster_path
        }
        
        return cell
    }
    
    func reloadTable() {
        self.tableView.reloadData()
    }
}
