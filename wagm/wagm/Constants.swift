//
//  Constants.swift
//  wagm
//
//  Created by wld on 28/01/2019.
//  Copyright © 2019 Vlad Burlaciuc. All rights reserved.
//

import Foundation






enum WebServiceEndpoint {
    // user
    case getUser
    case setUser
    
    // movies
    case getMovies
    case getFavorites
    case setFavorite
    case setUnfavorite
    
    
    static private let apiPaths:[WebServiceEndpoint: String] = [
        getUser: "/api/users?username=%@",
        setUser: "/api/users.json",
        getMovies: "/api/movies",
        getFavorites: "/api/users/%@/movies",
        setFavorite: "/api/users/%@/movies/%@/favorite",
        setUnfavorite: "/api/users/%@/movies/%@/unfavorite"
    ]
    
    func baseUrl() -> String {
        return "http://46.101.218.241"
    }
    
    func fullURL() -> String {
        let fullEnpoint = baseUrl()  + WebServiceEndpoint.apiPaths[self]!
        
        return fullEnpoint
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
