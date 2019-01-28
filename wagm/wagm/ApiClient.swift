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
                print("error calling GET on /todos/1")
                print(response.result.error!)
                return
            }
            
            // make sure we got some JSON since that's what we expect
            guard let json = response.result.value as? [String: Any] else {
                print("didn't get todo object as JSON from API")
                if let error = response.result.error {
                    print("Error: \(error)")
                }
                return
            }
            
            // get and print the title
            guard let todoTitle = json["title"] as? String else {
                print("Could not get todo title from JSON")
                return
            }
            print("The title is: " + todoTitle)
        }
    }
 
    
    
    
    func POST(url: String!, parameters:[String:String], completionHandler: @escaping (_ result: [String:Any]) -> ()) {
                
//        let parameters = [
//            "name": "user1",
//            "email": "user1@org"
//        ]
    
        Alamofire.request(url, method:.post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            guard response.result.error == nil else {
                // got an error in getting the data, need to handle it
                print("error calling POST on /todos/1")
                print(response.result.error!)
                return
            }
            // make sure we got some JSON since that's what we expect
            guard let json = response.result.value as? [String: Any] else {
                print("didn't get todo object as JSON from API")
                if let error = response.result.error {
                    print("Error: \(error)")
                }
                return
            }
            // get and print the title
            guard let idNumber = json["id"] as? Int else {
                print("Could not get id number from JSON")
                return
            }
            print("Created todo with id: \(idNumber)")
        }
        
        
    }
}
