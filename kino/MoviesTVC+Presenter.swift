//
//  MoviesTVC+Presenter.swift
//  kino
//
//  Created by Admin on 26.03.17.
//  Copyright © 2017 Admin. All rights reserved.
//

extension MoviesTVC {
    
    /// Загрузить данные по фильмам
    func loadMovies() {
        let request =  MTMoviesRequest()
        MTNetwork.makeRequest(request: request) { [weak self] (response: MTMoviesResponse?, error: Error?) in
            if response != nil {
                self?.movies = response!.results
                self?.reloadTable()
            }
        }
    }
    
}
