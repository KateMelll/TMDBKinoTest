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
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        poster_path             <- map["poster_path"]
        title                   <- map["title"]
    }
}
