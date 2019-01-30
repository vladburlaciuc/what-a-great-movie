//
//  PlainUser.swift
//  What a great movie!
//
//  Created by wld on 28/01/2019.
//  Copyright © 2019 Vlad Burlaciuc. All rights reserved.
//

import Foundation
import SwiftyJSON

public class PlainUser {
    
    public var id: Int
    public var name: String
    public var createAt: String
    public var updatedAt: String
    public var url: String
    
    init(settingsData: JSON) {
        self.id = settingsData["id"].intValue
        self.name = settingsData["name"].stringValue
        self.createAt = settingsData["createAt"].stringValue
        self.updatedAt = settingsData["updatedAt"].stringValue
        self.url = settingsData["url"].stringValue
    }
}
