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
    
    init(settingsData: [String:Any]) {
        self.id = settingsData["id"] as? Int ?? 0
        self.name = settingsData["username"] as? String ?? ""
        self.createAt = settingsData["createAt"] as? String ?? ""
        self.updatedAt = settingsData["updatedAt"] as? String ?? ""
        self.url = settingsData["url"]  as? String ?? ""
    }
}
