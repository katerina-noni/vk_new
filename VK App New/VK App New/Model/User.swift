//
//  User.swift
//  VK App New
//
//  Created by Екатерина on 15/12/2019.
//  Copyright © 2019 noni. All rights reserved.
//

import Foundation
import SwiftyJSON

class User {
    let id: Int
    let firstName: String
    let lastName: String
    let photoURL: String
    var fullName: String { firstName + " " + lastName }
    
    init(from json: JSON) {
        self.id = json["item"][0]["id"].intValue
        self.firstName = json["items"][0]["first_name"].stringValue
        self.lastName = json["items"][0]["last_name"].stringValue
        self.photoURL = json["items"][0]["photo_100"].stringValue
    }
    
}
