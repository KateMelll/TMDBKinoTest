//
//  MoviesResponse.swift
//  kino
//
//  Created by Admin on 26.03.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import ObjectMapper

class MTMoviesResponse: Mappable {
    
    var results: [MTMovie] = []
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        results                 <- map["results"]
    }
}

class MTMovieDetailsResponse: Mappable {
    
    var result: MTMovieDetails?
    
    required init?(map: Map) { }

    func mapping(map: Map) {
        result                <- map["results"]
    }
    
}
