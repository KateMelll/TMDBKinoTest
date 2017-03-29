//
//  Constants.swift
//  kino
//
//  Created by Admin on 26.03.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation

class Constants {
 
    struct Server {
        static let PROTOCOL         = "https"
        static let HOSTNAME         = "api.themoviedb.org"
        static let API_VERSION      = "3"
        
        static let IMAGES_HOSTNAME          = "image.tmdb.org/t/p"
        static let IMAGES_DEFAULT_PARAMS    = "w500"
        
        static func rootPath() -> String {
            return "\(Server.PROTOCOL)://\(Server.HOSTNAME)/\(Server.API_VERSION)/"
        }
        
        static func imagesRootPath() -> String {
            return "\(Server.PROTOCOL)://\(Server.IMAGES_HOSTNAME)/\(Server.IMAGES_DEFAULT_PARAMS)/"
        }
    }
    
    static let API_KEY_TMDB = "7ae2b8cc0aa3fad69ea9901d0b6c2ac8"
    
}
