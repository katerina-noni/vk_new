//
//  User.swift
//  VK App New
//
//  Created by Екатерина on 15/12/2019.
//  Copyright © 2019 noni. All rights reserved.
//

import Foundation
import SwiftyJSON

class Groups {
    let id: Int
    let name: String
    let image: String
    
    init(from json: JSON) {
        self.id = json["items"][0]["id"].intValue
        self.name = json["items"][0]["name"].stringValue
        self.image = json["items"][0]["photo_100"].stringValue
    }
    static func == (lhs: Groups, rhs: Groups) -> Bool {
        return lhs.name == rhs.name && lhs.image == rhs.image
    }
}
