//
//  MoviesRequest.swift
//  kino
//
//  Created by Admin on 26.03.17.
//  Copyright © 2017 Admin. All rights reserved.
//

class MTMoviesRequest: MTBaseRequest {
    
    override func url() -> String {
        return "discover/movie"
    }
    
    init(params: MTMoviesRequestParameters = MTMoviesRequestParameters()) {
        super.init(parametes: params)
    }
}

class MTSoonRequest: MTBaseRequest {
    
    override func url() -> String {
        return "discover/movie"
    }
    
    init(params: MTMoviesRequestParameters = MTMoviesRequestParameters()) {
        super.init(parametes: params)
    }
}

class MTTopRequest: MTBaseRequest {
    
    override func url() -> String {
        return "discover/movie"
    }
    
    init(params: MTMoviesRequestParameters = MTMoviesRequestParameters()) {
        super.init(parametes: params)
    }
}

struct ParamsKeys {
    static let sorting = "sort_by"
}

enum SortingType: String {
    case popularityDesc = "popularity.desc"
    case popularityAsc = "popularity.asc"
}

class MTMoviesRequestParameters: MTBaseRequestParameters {

    var sorting = SortingType.popularityDesc
    
    override init() {
        super.init()
        self.parametes?[ParamsKeys.sorting] = sorting.rawValue
    }
    
}
