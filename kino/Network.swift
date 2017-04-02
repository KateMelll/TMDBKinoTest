//
//  Network.swift
//  kino
//
//  Created by Admin on 26.03.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import Alamofire
import ObjectMapper

class MTNetwork {
    
    /// Базовый запрос
    class func makeRequest<M: Mappable>(request: MTBaseRequest, callback: @escaping ((M?, Error?) -> ())) {
        
        Alamofire.request(Constants.Server.rootPath()+request.url(),
                          method: request.method(),
                          parameters: request.parameters(),
                          encoding: request.encoding(),
                          headers: request.headers()).responseJSON { response in
                            if response.result.isSuccess {
                                let data = Mapper<M>().map(JSONObject: response.result.value)
                                callback(data, nil)
                            }
                            else {
                                callback(nil, response.result.error)
                            }
        }
    }
}
