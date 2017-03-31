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

class MTPopularRequest: MTMoviesRequest {
    
    override func url() -> String {
        return "movie/popular"
    }
}

class MTUpcomingRequest: MTMoviesRequest {
    
    override func url() -> String {
        return "movie/upcoming"
    }
}

class MTTopRequest: MTMoviesRequest {
    
    override func url() -> String {
        return "movie/top_rated"
    }
}

class MTMovieDetailsRequest: MTMoviesRequest {
    
    var id: Int!
    override func url() -> String {
        return "movie/\(self.id!)"
    }
    
    init(id: Int, params: MTMoviesRequestParameters = MTMoviesRequestParameters()) {
        self.id = id
        super.init(params: params)
        self.parametres.parametes!["append_to_response"] = "release_dates"
    }
}

class MTMovieReleasesRequest: MTMoviesRequest {
    
    var id: Int!
    override func url() -> String {
        return "movie/\(self.id!)/release_dates"
    }
    init(id: Int, params: MTMoviesRequestParameters = MTMoviesRequestParameters()) {
        self.id = id
        super.init(params: params)
    }
}

class MTMovieCastRequest: MTMoviesRequest {
    
    var id: Int!
    override func url() -> String {
        return "movie/\(self.id!)/credits"
    }
    init(id: Int, params: MTMoviesRequestParameters = MTMoviesRequestParameters()) {
        self.id = id
        super.init(params: params)
    }
}

class MTMovieDirectorsRequest: MTMoviesRequest {
    
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
