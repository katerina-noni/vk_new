//
//  User.swift
//  VK App New
//
//  Created by Екатерина on 21/12/2019.
//  Copyright © 2019 noni. All rights reserved.
//

import SwiftyJSON

class Photos {
    let id: Int
    let likesCount: Int
    let likeUser: Int
    var imageCell: String = ""
    var imageFull: String = ""
    
    init(from json: JSON) {
        self.id = json["id"].intValue
        self.likesCount = json["count"].intValue
        self.likeUser = json["user_likes"].intValue
        
        guard let photoSize = json["sizes"].array?.first(where: { $0["type"] == "s" }) else { return }
        self.imageCell = photoSize["url"].stringValue
        
        if let imageCell = json["sizes"].array?.first(where: { $0["type"] == "m" })?["url"].string {
            self.imageCell = imageCell
        }
            self.imageFull = self.imageCell
        
        if let sizes = json["sizes"].array?
            .filter({ ["w", "z", "y", "x", "m"].contains($0["type"]) })
            .sorted(by: { $0["width"].intValue * $0["height"].intValue > $1["width"].intValue * $1["height"].intValue}),
            let photoUrlString = sizes.first?["url"].string {
            
            self.imageFull = photoUrlString
        }
    }
}
