//
//  UserService.swift
//  What a great movie!
//
//  Created by wld on 28/01/2019.
//  Copyright © 2019 Vlad Burlaciuc. All rights reserved.
//

import Foundation
import Alamofire


public class UserService {
    
    public func getUser(userName: String, completionHandler: @escaping (_ result: [String:Any]) -> ()) {
        let url = String.init(format: WebServiceEndpoint.getUser.fullURL(), userName)
        ApiClient().GET(url: url) { result in
            
                completionHandler(result)
        }
    }
    
    public func setUser(userName: String, completionHandler: @escaping (_ result: [String:Any]) -> ()) {
        
    }

    public func getMovies(completionHandler: @escaping (_ result: [String:Any]) -> ()) {
        
    }

    public func getFavorites(userName: String, completionHandler: @escaping (_ result: [String:Any]) -> ()) {
        
    }

    public func setFavorites(userName: String, movieId: String, completionHandler: @escaping (_ result: [String:Any]) -> ()) {
        
    }

    public func setUnfavorites(userName: String, movieId: String, completionHandler: @escaping (_ result: [String:Any]) -> ()) {
        
    }
    
}
