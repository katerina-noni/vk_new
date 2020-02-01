//  VK App New
//
//  Created by Екатерина on 01/02/2020.
//  Copyright © 2019 noni. All rights reserved.
//

import Foundation
import RealmSwift

class RealmPhotos: Object {
    @objc dynamic var id: Int  = 12
    @objc dynamic var likesCount: Int = 12
    @objc dynamic var likeUser: Int = 12
    @objc dynamic var imageCell: String = ""
    @objc dynamic var imageFull: String = ""
    
    convenience init(id: Int, likesCount: Int, likeUser: Int, imageCell: String, imageFull: String) {
        self.init()
        
        self.id = id
        self.likesCount = likesCount
        self.likeUser = likeUser
        self.imageCell = imageCell
        self.imageFull = imageFull
    }
}
