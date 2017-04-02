//
//  Movie.swift
//  kino
//
//  Created by KODE_H6 on 29.03.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import ObjectMapper

class MTMovie: Mappable {
    
    var poster_path: String?
    var title: String?
    var id: Int?
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        id                      <- map["id"]
        poster_path             <- map["poster_path"]
        title                   <- map["title"]
    }
}

class MTMovieDetails: Mappable {
    var id: Int!
    var budget: Int!
    var homepage: String!
    var original_title: String!
    var overview: String!
    var status: String!
    var title: String!
    var revenue: Int!
    var runtime: Int!
    var poster_path: String!
    var backdrop_path: String!
    var vote_average: Float!
    var release_date: String!
    
    var cert: String?
    
    required init?(map: Map) { }
    func mapping(map: Map) {
        id              <- map["id"]
        budget          <- map["budget"]
        homepage        <- map["homepage"]
        original_title  <- map["original_title"]
        overview        <- map["overview"]
        status          <- map["status"]
        title           <- map["title"]
        revenue         <- map["revenue"]
        runtime         <- map["runtime"]
        poster_path     <- map["poster_path"]
        backdrop_path   <- map["backdrop_path"]
        vote_average    <- map["vote_average"]
        release_date    <- map["release_date"]
    }
}
