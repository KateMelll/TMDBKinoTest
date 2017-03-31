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
//
//class MTReleaseDateResponse: Mappable {
//    var release_dates: [MTReleaseResponse]()
//    required init?(map: Map) { }
//    func mapping(map: Map) {
//        release_dates           <- map["release_dates"]
//    }
//}

class MTReleaseDateResultsResponse: Mappable {
    var results: [MTReleaseResponse] = []
    required init?(map: Map) { }
    func mapping(map: Map) {
        results                 <- map["results"]
    }

}

class MTReleaseResponse: Mappable {
    var iso: String!
    var date: [MTRelease] = []
    required init?(map: Map) { }
    func mapping(map: Map) {
        iso                     <- map["iso_3166_1"]
        date                    <- map["release_dates"]
    }

}

class MTRelease: Mappable {
    var certification: String!
    required init?(map: Map) { }
    func mapping(map: Map) {
        certification           <- map["certification"]
    }
}

class MTCastResponse: Mappable {
    var cast: [MTActors] = []
    required init?(map: Map) { }
    func mapping(map: Map) {
        cast                    <- map["cast"]
    }
}

class MTActors: Mappable {
    var name: String!
    var profile_path: String!
    required init?(map: Map) { }
    func mapping(map: Map) {
        name               <- map["name"]
        profile_path            <- map["profile_path"]
    }
}
