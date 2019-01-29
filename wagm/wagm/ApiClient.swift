//
//  ApiClient.swift
//  What a great movie!
//
//  Created by wld on 28/01/2019.
//  Copyright © 2019 Vlad Burlaciuc. All rights reserved.
//

import Foundation
import Alamofire


public class ApiClient {
    
    func GET(url: String!, completionHandler: @escaping (_ result: [String:Any]) -> ()){
        Alamofire.request(url).responseJSON {response in
            guard response.result.error == nil else {
                // got an error in getting the data, need to handle it
                completionHandler(["success":0,"error":response.result.error!])
                return
            }
            guard let jsonArray = response.result.value as? [[String: Any]] else {
                completionHandler(["success":2])
                return
            }
            if var json = jsonArray.first{
                json["success"] = 1
                completionHandler(json)
            }else{
                completionHandler(["success":2])
            }
        }
    }
 
    
    
    
    func POST(url: String!, parameters:[String:Any], completionHandler: @escaping (_ result: [String:Any]) -> ()) {
                
//        let parameters = [
//            "name": "user1",
//            "email": "user1@org"
//        ]
    
        Alamofire.request(url, method:.post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            guard response.result.error == nil else {
                // got an error in getting the data, need to handle it
                completionHandler(["success":0,"error":response.result.error!.localizedDescription])
                return
            }
            // make sure we got some JSON since that's what we expect
            guard var json = response.result.value as? [String: Any] else {
                completionHandler(["success":1,"error":"Something goes wrong, try again"])
                return
            }
            json["success"] = 1
            completionHandler(json)
        }
        
        
    }
}
