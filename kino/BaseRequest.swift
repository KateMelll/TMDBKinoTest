//
//  BaseRequest.swift
//  kino
//
//  Created by Admin on 26.03.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation
import Alamofire

class MTBaseRequest {
    
    var parametres: MTBaseRequestParameters
    
    init(parametes: MTBaseRequestParameters) {
        self.parametres = parametes
    }
    
    func headers() -> [String : String]? {
        return nil
    }
    
    func encoding() -> URLEncoding {
        return .default
    }
    
    func method() -> HTTPMethod {
        return .get
    }
    
    func url() -> String {
        return ""
    }
    
    func parameters() -> [String : Any]? {
        return parametres.getParameters()
    }
}

class MTBaseRequestParameters {
    var parametes: [String : Any]?
    
    init() {
        parametes = ["api_key" : Constants.API_KEY_TMDB]
    }
    
    func getParameters() -> [String : Any]? {
        return parametes
    }
}
