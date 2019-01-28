//
//  PlainMovie.swift
//  What a great movie!
//
//  Created by wld on 28/01/2019.
//  Copyright © 2019 Vlad Burlaciuc. All rights reserved.
//

import Foundation
import SwiftyJSON

public class PlainMovie {

    public var id: Int
    public var name: String
    public var year: Int
    public var thumbnail: String
    public var director: String
    public var main_star: String
    public var description: String
    public var created_at: Int
    public var updated_at: Int
    public var url: String
    public var gentres: [String:String]
    
    init(settingsData: JSON) {
        
        self.id = settingsData["id"].intValue
        self.name = settingsData["name"].stringValue
        self.year = settingsData["year"].intValue
        self.thumbnail = settingsData["thumbnail"].stringValue
        self.director = settingsData["director"].stringValue
        self.main_star = settingsData["main_star"].stringValue
        self.description = settingsData["description"].stringValue
        self.created_at = settingsData["create_at"].intValue
        self.updated_at = settingsData["update_at"].intValue
        self.url = settingsData["url"].stringValue
        self.gentres = settingsData["gentres"] as! ArraySlice
    }
}
