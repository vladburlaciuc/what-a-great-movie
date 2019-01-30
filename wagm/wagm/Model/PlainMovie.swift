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
    public var gentres: String
    public var isFavorite: Bool
    public var numberOfFavorites: Int
    
    init(settingsData: [String: Any]) {
        self.id = settingsData["id"] as? Int ?? 0
        self.name = settingsData["name"] as? String ?? ""
        self.year = settingsData["year"]  as? Int ?? 0
        self.thumbnail = settingsData["thumbnail"] as? String ?? ""
        self.director = settingsData["director"] as? String ?? ""
        self.main_star = settingsData["main_star"] as? String ?? ""
        self.description = settingsData["description"] as? String ?? ""
        self.created_at = settingsData["create_at"] as? Int ?? 0
        self.updated_at = settingsData["update_at"] as? Int ?? 0
        self.url = settingsData["url"] as? String ?? ""
        self.isFavorite = false
        self.numberOfFavorites = settingsData["favorite_number"] as? Int ?? 0
        self.gentres = ""
        if let array = settingsData["gentres"] as? [[String:String]]{
            for element in array{
                self.gentres.append(element["name"] ?? "")
                self.gentres.append(" ")
            }
        }
    }
}
